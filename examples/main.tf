module "ses-domain-com" {
  source          = "git::https://gitlab.com/ganex-cloud/terraform/terraform-aws-ses.git?ref=master"
  domain_name     = "domain.com"
  route53_zone_id = "XXXXXXXX"
}
