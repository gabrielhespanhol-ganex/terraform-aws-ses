variable "vdm_enabled" {
  description = "Whether Virtual Deliverability Manager is enabled for the AWS account in this region."
  type        = string
  nullable    = false

  validation {
    condition     = contains(["ENABLED", "DISABLED"], var.vdm_enabled)
    error_message = "vdm_enabled must be ENABLED or DISABLED."
  }
}

variable "engagement_metrics" {
  description = "Whether VDM engagement metrics collection is enabled."
  type        = string
  default     = "DISABLED"
  nullable    = false

  validation {
    condition     = contains(["ENABLED", "DISABLED"], var.engagement_metrics)
    error_message = "engagement_metrics must be ENABLED or DISABLED."
  }
}

variable "optimized_shared_delivery" {
  description = "Whether VDM optimized shared delivery is enabled."
  type        = string
  default     = "DISABLED"
  nullable    = false

  validation {
    condition     = contains(["ENABLED", "DISABLED"], var.optimized_shared_delivery)
    error_message = "optimized_shared_delivery must be ENABLED or DISABLED."
  }
}
