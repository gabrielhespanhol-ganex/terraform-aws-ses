resource "aws_sesv2_configuration_set" "this" {
  configuration_set_name = var.name
  tags                   = var.tags

  delivery_options {
    sending_pool_name = var.sending_pool_name
    tls_policy        = var.tls_policy
  }

  reputation_options {
    reputation_metrics_enabled = var.reputation_metrics_enabled
  }

  sending_options {
    sending_enabled = var.sending_enabled
  }

  dynamic "suppression_options" {
    for_each = length(var.suppressed_reasons) > 0 ? [1] : []
    content {
      suppressed_reasons = var.suppressed_reasons
    }
  }

  dynamic "tracking_options" {
    for_each = var.custom_redirect_domain != null ? [1] : []
    content {
      custom_redirect_domain = var.custom_redirect_domain
    }
  }
}
