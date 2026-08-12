resource "aws_sesv2_dedicated_ip_pool" "this" {
  pool_name    = var.name
  scaling_mode = var.scaling_mode
  tags         = var.tags
}
