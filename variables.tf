variable "domain_name" {
  description = "The domain name to configure SES."
  type        = "string"
}

variable "enable_verification" {
  description = "Control whether or not to verify SES DNS records."
  type        = "string"
  default     = true
}

variable "route53_zone_id" {
  description = "Route53 host zone ID to enable SES."
  type        = "string"
  default     = ""
}
