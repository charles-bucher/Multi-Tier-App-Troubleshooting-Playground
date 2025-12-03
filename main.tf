# -------------------------
# Provider
# -------------------------
provider "aws" {
  region = "us-east-1"
}

# -------------------------
# VPC & Subnets
# -------------------------
resource "aws_vpc" "multi_tier_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = { Name = "multi-tier-vpc" }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.multi_tier_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
  tags = { Name = "public-subnet" }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.multi_tier_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a"
  tags = { Name = "private-subnet" }
}

# -------------------------
# Internet Gateway & Route Table
# -------------------------
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.multi_tier_vpc.id
  tags   = { Name = "main-igw" }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.multi_tier_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = { Name = "public-rt" }
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

# -------------------------
# Security Groups
# -------------------------
resource "aws_security_group" "frontend_sg" {
  name        = "frontend-sg"
  description = "Allow HTTP/SSH from anywhere"
  vpc_id      = aws_vpc.multi_tier_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "frontend-sg" }
}

resource "aws_security_group" "backend_sg" {
  name        = "backend-sg"
  description = "Allow traffic from frontend SG only"
  vpc_id      = aws_vpc.multi_tier_vpc.id

  ingress {
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    security_groups = [aws_security_group.frontend_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "backend-sg" }
}

resource "aws_security_group" "db_sg" {
  name        = "db-sg"
  description = "Allow traffic from backend SG only"
  vpc_id      = aws_vpc.multi_tier_vpc.id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.backend_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "db-sg" }
}

# -------------------------
# IAM Roles & Instance Profile
# -------------------------
resource "aws_iam_role" "backend_role" {
  name = "multi-tier-backend-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "ec2.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })

  tags = { Project = "Multi-Tier App", Tier = "Backend" }
}

resource "aws_iam_role_policy_attachment" "backend_s3_dynamo" {
  role       = aws_iam_role.backend_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

resource "aws_iam_role_policy_attachment" "backend_dynamo" {
  role       = aws_iam_role.backend_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
}

resource "aws_iam_instance_profile" "backend_profile" {
  name = "multi-tier-backend-profile"
  role = aws_iam_role.backend_role.name
}

resource "aws_iam_role" "db_role" {
  name = "multi-tier-db-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "rds.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })

  tags = { Project = "Multi-Tier App", Tier = "Database" }
}

resource "aws_iam_role_policy_attachment" "db_cloudwatch" {
  role       = aws_iam_role.db_role.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchFullAccess"
}

# -------------------------
# Key Pair
# -------------------------
resource "aws_key_pair" "deployer_key" {
  key_name   = "multi-tier-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

# -------------------------
# EC2 Instances
# -------------------------
resource "aws_instance" "frontend" {
  ami             = "ami-0c55b159cbfafe1f0"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.public_subnet.id
  key_name        = aws_key_pair.deployer_key.key_name
  security_groups = [aws_security_group.frontend_sg.name]

  tags = { Name = "frontend-server" }

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl enable httpd
              systemctl start httpd
              EOF
}

resource "aws_instance" "backend" {
  ami                    = "ami-0c55b159cbfafe1f0"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private_subnet.id
  key_name               = aws_key_pair.deployer_key.key_name
  security_groups        = [aws_security_group.backend_sg.name]
  iam_instance_profile   = aws_iam_instance_profile.backend_profile.name

  tags = { Name = "backend-server" }

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y python3
              mkdir -p /opt/backend
              EOF
}

# -------------------------
# RDS Database
# -------------------------
resource "random_password" "db_password" {
  length  = 16
  special = true
}

resource "aws_db_subnet_group" "db_subnets" {
  name       = "db-subnets"
  subnet_ids = [aws_subnet.private_subnet.id]
  tags       = { Name = "db-subnet-group" }
}

resource "aws_db_instance" "database" {
  identifier             = "multi-tier-db"
  engine                 = "mysql"
  instance_class         = "db.t2.micro"
  allocated_storage      = 20
  username               = "admin"
  password               = random_password.db_password.result
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.db_subnets.name
  publicly_accessible    = false
  tags                   = { Name = "multi-tier-db" }
}
