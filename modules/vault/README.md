[![License](https://img.shields.io/badge/License-Apache-blue.svg)](https://github.com/boldlink/terraform-aws-backup/blob/main/LICENSE)
[![Latest Release](https://img.shields.io/github/release/boldlink/terraform-aws-backup.svg)](https://github.com/boldlink/terraform-aws-backup/releases/latest)
[![Build Status](https://github.com/boldlink/terraform-aws-backup/actions/workflows/update.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-backup/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-backup/actions/workflows/release.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-backup/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-backup/actions/workflows/pre-commit.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-backup/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-backup/actions/workflows/pr-labeler.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-backup/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-backup/actions/workflows/module-examples-tests.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-backup/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-backup/actions/workflows/checkov.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-backup/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-backup/actions/workflows/auto-merge.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-backup/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-backup/actions/workflows/auto-badge.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-backup/actions)

[<img src="https://avatars.githubusercontent.com/u/25388280?s=200&v=4" width="96"/>](https://boldlink.io)

# AWS Backup Vault Terraform module

\<Description>

This terraform sub-module creates a backup vault in AWS.

## Usage
*NOTE*: These examples use the latest version of this module

```console
module "backup_vault" {
  source  = "boldlink/<module_name>/<provider>//modules/<nested_name>"
  version = "x.x.x"
  # insert the minimum required variables here
  ...
}
```
## Documentation

[Amazon Documentation](https://docs.aws.amazon.com/aws-backup/latest/devguide/vaults.html)

[Terraform module documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/backup_vault)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.11 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.20.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.47.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_backup_vault.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/backup_vault) | resource |
| [aws_backup_vault_notifications.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/backup_vault_notifications) | resource |
| [aws_backup_vault_policy.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/backup_vault_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backup_vault_events"></a> [backup\_vault\_events](#input\_backup\_vault\_events) | An array of events that indicate the status of jobs to back up resources to the backup vault. | `list(string)` | `[]` | no |
| <a name="input_backup_vault_policy"></a> [backup\_vault\_policy](#input\_backup\_vault\_policy) | The backup vault access policy document in JSON format. | `string` | `""` | no |
| <a name="input_create_backup_vault"></a> [create\_backup\_vault](#input\_create\_backup\_vault) | Whether to create AWS backup Vault or not | `bool` | `true` | no |
| <a name="input_create_backup_vault_policy"></a> [create\_backup\_vault\_policy](#input\_create\_backup\_vault\_policy) | Whether to create AWS backup Vault policy or not | `bool` | `true` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | (Optional, Default: false) A boolean that indicates that all recovery points stored in the vault are deleted so that the vault can be destroyed without error. | `bool` | `false` | no |
| <a name="input_kms_key_arn"></a> [kms\_key\_arn](#input\_kms\_key\_arn) | (Optional) The server-side encryption key that is used to protect your backups. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) Name of the backup vault to create. | `string` | n/a | yes |
| <a name="input_sns_notify"></a> [sns\_notify](#input\_sns\_notify) | Whether to create AWS Backup vault notifications resource. | `bool` | `false` | no |
| <a name="input_sns_topic_arn"></a> [sns\_topic\_arn](#input\_sns\_topic\_arn) | The Amazon Resource Name (ARN) that specifies the topic for a backup vault’s events | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Metadata that you can assign to help organize the resources that you create. If configured with a provider default\_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the vault. |
| <a name="output_id"></a> [id](#output\_id) | The name of the vault. |
| <a name="output_recovery_points"></a> [recovery\_points](#output\_recovery\_points) | The number of recovery points that are stored in a backup vault. |
| <a name="output_tags_all"></a> [tags\_all](#output\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider default\_tags configuration block. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Third party software
This repository uses third party software:
* [pre-commit](https://pre-commit.com/) - Used to help ensure code and documentation consistency
  * Install with `brew install pre-commit`
  * Manually use with `pre-commit run`
* [terraform 0.14.11](https://releases.hashicorp.com/terraform/0.14.11/) For backwards compatibility we are using version 0.14.11 for testing making this the min version tested and without issues with terraform-docs.
* [terraform-docs](https://github.com/segmentio/terraform-docs) - Used to generate the [Inputs](#Inputs) and [Outputs](#Outputs) sections
  * Install with `brew install terraform-docs`
  * Manually use via pre-commit
* [tflint](https://github.com/terraform-linters/tflint) - Used to lint the Terraform code
  * Install with `brew install tflint`
  * Manually use via pre-commit

#### BOLDLink-SIG 2024
