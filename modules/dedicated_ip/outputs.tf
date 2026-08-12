output "arn" {
  description = "ARN of the Dedicated IP Pool."
  value       = aws_sesv2_dedicated_ip_pool.this.arn
}

output "name" {
  description = "Name of the Dedicated IP Pool."
  value       = var.name
}
