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

# Terraform  module example of complete and most common configuration


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.11 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.20.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.0.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_backup_plan"></a> [backup\_plan](#module\_backup\_plan) | ./../../ | n/a |
| <a name="module_backup_vault"></a> [backup\_vault](#module\_backup\_vault) | ./../../modules/vault | n/a |
| <a name="module_cold_storage_plan"></a> [cold\_storage\_plan](#module\_cold\_storage\_plan) | ./../../ | n/a |
| <a name="module_kms"></a> [kms](#module\_kms) | boldlink/kms/aws | 1.2.0 |
| <a name="module_sns_topic"></a> [sns\_topic](#module\_sns\_topic) | boldlink/sns/aws | 1.1.2 |

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.vault](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backup_vault_events"></a> [backup\_vault\_events](#input\_backup\_vault\_events) | An array of events that indicate the status of jobs to back up resources to the backup vault. | `list(string)` | <pre>[<br>  "BACKUP_JOB_STARTED",<br>  "RESTORE_JOB_COMPLETED"<br>]</pre> | no |
| <a name="input_create_backup_vault_policy"></a> [create\_backup\_vault\_policy](#input\_create\_backup\_vault\_policy) | Whether to create AWS backup Vault policy or not | `bool` | `true` | no |
| <a name="input_deletion_window_in_days"></a> [deletion\_window\_in\_days](#input\_deletion\_window\_in\_days) | The waiting period, specified in number of days. After the waiting period ends, AWS KMS deletes the KMS key. If you specify a value, it must be between 7 and 30, inclusive. If you do not specify a value, it defaults to 30. If the KMS key is a multi-Region primary key with replicas, the waiting period begins when the last of its replica keys is deleted. Otherwise, the waiting period begins immediately. | `number` | `7` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | (Optional, Default: false) A boolean that indicates that all recovery points stored in the vault are deleted so that the vault can be destroyed without error. | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | The display name of the stack. | `string` | `"example-complete-backup"` | no |
| <a name="input_sns_notify"></a> [sns\_notify](#input\_sns\_notify) | Whether to create AWS Backup vault notifications resource. | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Metadata that you can assign to help organize the resources that you create. If configured with a provider default\_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level. | `map(string)` | <pre>{<br>  "Department": "devops",<br>  "Environment": "examples",<br>  "LayerId": "examples",<br>  "LayerName": "exampls",<br>  "Owner": "Boldlink",<br>  "Project": "terraform-modules",<br>  "user::CostCenter": "terraform"<br>}</pre> | no |

## Outputs

No outputs.
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
