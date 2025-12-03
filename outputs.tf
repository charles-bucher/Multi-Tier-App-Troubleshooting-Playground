output "frontend_public_ip" {
  description = "Public IP of the frontend EC2 instance"
  value       = aws_instance.frontend.public_ip
}

output "backend_private_ip" {
  description = "Private IP of the backend EC2 instance"
  value       = aws_instance.backend.private_ip
}

output "backend_iam_role" {
  description = "IAM Role attached to backend EC2 instance"
  value       = aws_iam_role.backend_role.name
}

output "db_endpoint" {
  description = "RDS database endpoint"
  value       = aws_db_instance.database.endpoint
}

output "db_username" {
  description = "Database master username"
  value       = aws_db_instance.database.username
}

output "db_password" {
  description = "Randomly generated database password (for demo/testing)"
  value       = random_password.db_password.result
}
