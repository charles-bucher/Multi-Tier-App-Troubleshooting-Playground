# AWS region
variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

# VPC CIDR
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# Subnets
variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

# EC2 instance types
variable "frontend_instance_type" {
  description = "Instance type for frontend EC2"
  type        = string
  default     = "t2.micro"
}

variable "backend_instance_type" {
  description = "Instance type for backend EC2"
  type        = string
  default     = "t2.micro"
}

# EC2 AMI
variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
  default     = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2
}

# SSH Key
variable "ssh_public_key_path" {
  description = "Path to the SSH public key for EC2 login"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

# Database credentials
variable "db_username" {
  description = "Database admin username"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Database admin password"
  type        = string
  default     = "Password123!"
}

variable "db_allocated_storage" {
  description = "Database allocated storage in GB"
  type        = number
  default     = 20
}

variable "db_instance_class" {
  description = "Database instance class"
  type        = string
  default     = "db.t2.micro"
}
