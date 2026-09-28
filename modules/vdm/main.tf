resource "aws_sesv2_account_vdm_attributes" "this" {
  vdm_enabled = var.vdm_enabled

  dashboard_attributes {
    engagement_metrics = var.engagement_metrics
  }

  guardian_attributes {
    optimized_shared_delivery = var.optimized_shared_delivery
  }
}
