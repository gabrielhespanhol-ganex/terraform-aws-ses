module "this" {
  source = "../../"

  domain_name                            = "example.com"
  enable_verification                    = false
  enable_domain_dkim                     = false
  enable_notifications                   = false
  notifications_sns_topic_arn            = null
  notifications_type                     = []
  notifications_include_original_headers = false
  configuration_set_name                 = null

  tags = {
    Example = "complete"
  }
}

module "vdm" {
  source = "../../modules/vdm"

  vdm_enabled               = "ENABLED"
  engagement_metrics        = "DISABLED"
  optimized_shared_delivery = "DISABLED"
}
