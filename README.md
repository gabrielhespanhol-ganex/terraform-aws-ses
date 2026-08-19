# terraform-aws-ses

Terraform module that provisions SES domain identities, Easy DKIM CNAME records, and SES notification topics.

For domain identities, Amazon SES v2 verifies Easy DKIM through three CNAME records. This module does not manage the legacy `_amazonses` TXT record.

## Compatibility

This module requires Terraform 1.6.0 or later and supports AWS provider versions from 5.40.0 up to, but not including, 7.0.0.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.40.0, < 7.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.40.0, < 7.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route53_record.dkim](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_ses_domain_dkim.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_domain_dkim) | resource |
| [aws_ses_identity_notification_topic.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_identity_notification_topic) | resource |
| [aws_sesv2_email_identity.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sesv2_email_identity) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_configuration_set_name"></a> [configuration\_set\_name](#input\_configuration\_set\_name) | (Optional) The configuration set to use by default when sending from this identity. | `string` | `null` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The domain name to configure SES. | `string` | n/a | yes |
| <a name="input_enable_domain_dkim"></a> [enable\_domain\_dkim](#input\_enable\_domain\_dkim) | Control whether or not generate domain DKIM resource. | `string` | `true` | no |
| <a name="input_enable_notifications"></a> [enable\_notifications](#input\_enable\_notifications) | (Required) Control whether or not send feedback notifications. | `bool` | `false` | no |
| <a name="input_enable_verification"></a> [enable\_verification](#input\_enable\_verification) | Control whether or not to verify SES DNS records. | `string` | `true` | no |
| <a name="input_notifications_include_original_headers"></a> [notifications\_include\_original\_headers](#input\_notifications\_include\_original\_headers) | (Optional) Whether SES should include original email headers in SNS notifications of this type. false by default. | `bool` | `false` | no |
| <a name="input_notifications_sns_topic_arn"></a> [notifications\_sns\_topic\_arn](#input\_notifications\_sns\_topic\_arn) | (Required) The Amazon Resource Name (ARN) of the Amazon SNS topic. | `string` | `null` | no |
| <a name="input_notifications_type"></a> [notifications\_type](#input\_notifications\_type) | (Required) A list of notifications that will be published to the specified Amazon SNS topic. Valid Values: Bounce, Complaint or Delivery. | `list(string)` | `[]` | no |
| <a name="input_route53_zone_id"></a> [route53\_zone\_id](#input\_route53\_zone\_id) | Route53 host zone ID to enable SES. | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Additional Tags | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ses_identity_arn"></a> [ses\_identity\_arn](#output\_ses\_identity\_arn) | SES identity ARN. |
<!-- END_TF_DOCS -->

## Example

See [`examples/complete`](examples/complete).
