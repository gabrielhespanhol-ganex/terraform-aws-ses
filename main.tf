resource "aws_sesv2_email_identity" "main" {
  email_identity         = var.domain_name
  configuration_set_name = var.configuration_set_name
  tags                   = length(var.tags) > 0 ? var.tags : null
}

#
# SES DKIM Verification
#
resource "aws_ses_domain_dkim" "main" {
  count  = var.enable_domain_dkim ? 1 : 0
  domain = var.domain_name
}

resource "aws_route53_record" "dkim" {
  count   = var.enable_verification && var.enable_domain_dkim ? 3 : 0
  zone_id = var.route53_zone_id
  name    = format("%s._domainkey.%s", element(aws_ses_domain_dkim.main[0].dkim_tokens, count.index), var.domain_name)
  type    = "CNAME"
  ttl     = "600"
  records = ["${element(aws_ses_domain_dkim.main[0].dkim_tokens, count.index)}.dkim.amazonses.com"]
}

#
# SES Notifications
#
resource "aws_ses_identity_notification_topic" "this" {
  count                    = var.enable_notifications ? length(var.notifications_type) : 0
  topic_arn                = var.notifications_sns_topic_arn
  notification_type        = var.notifications_type[count.index]
  identity                 = var.domain_name
  include_original_headers = var.notifications_include_original_headers
}
