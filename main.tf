provider "aws" {
  region = "us-east-1"  # adjust as needed
}

# -------------------------
# VPC
# -------------------------
resource "aws_vpc" "multi_tier_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = { Name = "multi-tier-vpc" }
}

# -------------------------
# Subnets
# -------------------------
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
  tags = { Name = "main-igw" }
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
# Frontend SG
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

# Backend SG
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

# Database SG
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
# Key Pair for SSH
# -------------------------
resource "aws_key_pair" "deployer_key" {
  key_name   = "multi-tier-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

# -------------------------
# EC2 Instances
# -------------------------
# Frontend
resource "aws_instance" "frontend" {
  ami                    = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = aws_key_pair.deployer_key.key_name
  security_groups        = [aws_security_group.frontend_sg.name]

  tags = { Name = "frontend-server" }

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl enable httpd
              systemctl start httpd
              EOF
}

# Backend
resource "aws_instance" "backend" {
  ami                    = "ami-0c55b159cbfafe1f0"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private_subnet.id
  key_name               = aws_key_pair.deployer_key.key_name
  security_groups        = [aws_security_group.backend_sg.name]

  tags = { Name = "backend-server" }

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y python3
              mkdir -p /opt/backend
              EOF
}

# Database (RDS)
resource "aws_db_instance" "database" {
  identifier              = "multi-tier-db"
  engine                  = "mysql"
  instance_class          = "db.t2.micro"
  allocated_storage       = 20
  username                = "admin"
  password                = "Password123!"  # for demo; use secrets manager in prod
  skip_final_snapshot     = true
  vpc_security_group_ids  = [aws_security_group.db_sg.id]
  db_subnet_group_name    = aws_db_subnet_group.db_subnets.name
}

# DB Subnet Group
resource "aws_db_subnet_group" "db_subnets" {
  name       = "db-subnets"
  subnet_ids = [aws_subnet.private_subnet.id]

  tags = { Name = "db-subnet-group" }
}

# -------------------------
# Outputs
# -------------------------
output "frontend_public_ip" {
  value = aws_instance.frontend.public_ip
}

output "backend_private_ip" {
  value = aws_instance.backend.private_ip
}

output "db_endpoint" {
  value = aws_db_instance.database.endpoint
}
