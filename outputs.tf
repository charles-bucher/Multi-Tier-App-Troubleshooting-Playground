# Frontend public IP
output "frontend_public_ip" {
  description = "Public IP of the frontend EC2 instance"
  value       = aws_instance.frontend.public_ip
}

# Backend private IP
output "backend_private_ip" {
  description = "Private IP of the backend EC2 instance"
  value       = aws_instance.backend.private_ip
}

# Database endpoint
output "db_endpoint" {
  description = "RDS MySQL endpoint"
  value       = aws_db_instance.database.endpoint
}

# VPC ID
output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.multi_tier_vpc.id
}

# Public subnet ID
output "public_subnet_id" {
  description = "Public subnet ID"
  value       = aws_subnet.public_subnet.id
}

# Private subnet ID
output "private_subnet_id" {
  description = "Private subnet ID"
  value       = aws_subnet.private_subnet.id
}
