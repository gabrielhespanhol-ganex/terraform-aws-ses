# SES VDM

Terraform submodule that manages Amazon SES Virtual Deliverability Manager account attributes.

VDM is scoped to one AWS account and one provider region. Instantiate this module once per region; do not add it to the root SES identity module, which is intended to be instantiated once per identity.

## Lifecycle

Destroying or removing this module disables VDM for the AWS account and provider region. To deliberately disable VDM while keeping its account attributes managed by Terraform, set `vdm_enabled = "DISABLED"`.

## Example

```hcl
module "vdm" {
  source = "ganexcloud/ses/aws//modules/vdm"

  vdm_enabled               = "ENABLED"
  engagement_metrics        = "DISABLED"
  optimized_shared_delivery = "DISABLED"
}
```

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
| [aws_sesv2_account_vdm_attributes.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sesv2_account_vdm_attributes) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_engagement_metrics"></a> [engagement\_metrics](#input\_engagement\_metrics) | Whether VDM engagement metrics collection is enabled. | `string` | `"DISABLED"` | no |
| <a name="input_optimized_shared_delivery"></a> [optimized\_shared\_delivery](#input\_optimized\_shared\_delivery) | Whether VDM optimized shared delivery is enabled. | `string` | `"DISABLED"` | no |
| <a name="input_vdm_enabled"></a> [vdm\_enabled](#input\_vdm\_enabled) | Whether Virtual Deliverability Manager is enabled for the AWS account in this region. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Identifier of the managed SES VDM account attributes. |
<!-- END_TF_DOCS -->
