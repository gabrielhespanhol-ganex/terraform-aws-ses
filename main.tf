locals {
  stripped_domain_name = replace(var.domain_name, "/[.]$/", "")
  dash_domain          = replace(var.domain_name, ".", "-")
}

#
# SES Domain Verification
#

resource "aws_ses_domain_identity" "main" {
  domain = local.stripped_domain_name
}

resource "aws_ses_domain_identity_verification" "main" {
  count      = var.enable_verification ? 1 : 0
  domain     = aws_ses_domain_identity.main.id
  depends_on = [aws_route53_record.ses_verification]
}

resource "aws_route53_record" "ses_verification" {
  count   = var.enable_verification ? 1 : 0
  zone_id = var.route53_zone_id
  name    = "_amazonses.${aws_ses_domain_identity.main.id}"
  type    = "TXT"
  ttl     = "600"
  records = [aws_ses_domain_identity.main.verification_token]
}

#
# SES DKIM Verification
#

resource "aws_ses_domain_dkim" "main" {
  domain = aws_ses_domain_identity.main.domain
}

resource "aws_route53_record" "dkim" {
  count   = var.enable_verification ? 1 : 0
  zone_id = var.route53_zone_id
  name    = format("%s._domainkey.%s", element(aws_ses_domain_dkim.main.dkim_tokens, count.index), var.domain_name)
  type    = "CNAME"
  ttl     = "600"
  records = ["${element(aws_ses_domain_dkim.main.dkim_tokens, count.index)}.dkim.amazonses.com"]
}

#
# SES Notifications
#

resource "aws_ses_identity_notification_topic" "this" {
  count                    = var.enable_notifications ? length(var.notifications_type) : 0
  topic_arn                = var.notifications_sns_topic_arn
  notification_type        = var.notifications_type[count.index]
  identity                 = aws_ses_domain_identity.main.domain
  include_original_headers = var.notifications_include_original_headers
}
