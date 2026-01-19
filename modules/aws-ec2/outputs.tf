output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.demo.id
}

output "instance_private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.demo.private_ip
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance (if assigned)"
  value       = aws_instance.demo.public_ip
}

output "instance_availability_zone" {
  description = "Availability zone of the EC2 instance"
  value       = aws_instance.demo.availability_zone
}
