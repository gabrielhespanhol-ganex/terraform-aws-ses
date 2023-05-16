variable "name" {
  description = "(Required) Name of the dedicated IP pool."
  type        = string
  default     = "default"
}

variable "scaling_mode" {
  description = "(Optional) IP pool scaling mode. Valid values: STANDARD, MANAGED. If omitted, the AWS API will default to a standard pool."
  type        = string
  default     = "STANDARD"
}

variable "tags" {
  type        = map(string)
  description = "(Optional) Additional Tags"
  default     = {}
}