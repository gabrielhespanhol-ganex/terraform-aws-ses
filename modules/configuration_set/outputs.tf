output "arn" {
  description = "ARN of the Configuration Set."
  value       = aws_sesv2_configuration_set.this.arn
}

output "name" {
  description = "Name of the Configuration Set."
  value       = var.name
}
