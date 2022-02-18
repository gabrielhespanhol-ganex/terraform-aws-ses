variable "domain_name" {
  description = "The domain name to configure SES."
  type        = string
}

variable "enable_verification" {
  description = "Control whether or not to verify SES DNS records."
  type        = string
  default     = true
}

variable "route53_zone_id" {
  description = "Route53 host zone ID to enable SES."
  type        = string
  default     = ""
}

variable "enable_notifications" {
  description = "(Required) Control whether or not send feedback notifications."
  type        = bool
  default     = false
}

variable "notifications_sns_topic_arn" {
  description = "(Required) The Amazon Resource Name (ARN) of the Amazon SNS topic."
  type        = string
}

variable "notifications_type" {
  description = "(Required) A list of notifications that will be published to the specified Amazon SNS topic. Valid Values: Bounce, Complaint or Delivery."
  type        = list(string)
}

variable "notifications_include_original_headers" {
  description = "(Optional) Whether SES should include original email headers in SNS notifications of this type. false by default."
  type        = bool
  default     = false
}
