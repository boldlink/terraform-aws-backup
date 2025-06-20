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

# AWS Backup Terraform Module

## Description

AWS Backup is a fully-managed service that makes it easy to centralize and automate data protection across AWS services, in the cloud, and on premises.

This Terraform module provisions and manages AWS Backup resources including backup plans, IAM roles, backup vaults, and related configurations.

## Why use this module over standard resources
- Simplified Management: Abstracts away the complexity of provisioning and configuring AWS Backup resources, reducing the potential for errors and streamlining management tasks.
- Consistent Configuration: Ensures consistency in backup plan configurations across environments, promoting best practices and compliance with organizational policies.
- Scalability: Easily scale your backup infrastructure by defining multiple backup plans and vaults, adapting to changing backup requirements without manual intervention.
- Flexibility: Customize backup rules, IAM roles, vault policies, and SNS notifications to suit your specific backup and recovery needs, providing a tailored solution for your applications and data.

Examples available [`here`](https://github.com/boldlink/terraform-aws-backup/tree/main/examples)

## Usage
*NOTE*: These examples use the latest version of this module

```console
module "backup_vault" {
  source  = "boldlink/backup/aws//modules/vault"
  version = "<enter_latest_version_here>"
  name    = "${var.name}-vault"
}

module "backup_plan" {
  source          = "boldlink/backup/aws"
  version         = "<enter_latest_version_here>"
  plan_name = "${var.name}-plan"
  backup_rules = [
    {
      rule_name         = "${var.name}-rule"
      target_vault_name = module.backup_vault.id[0]
      schedule          = "cron(0 1 ? * * *)"
    },
  ]
}

variable "name" {
  description = "The display name of the stack"
  type        = string
  default     = "Example-minimum-backup"
}
```
## Documentation

[AWS Backup Documentation](https://docs.aws.amazon.com/aws-backup/latest/devguide/whatisbackup.html)

[Terraform module documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/backup_plan)

**NOTE**
- Support for specifying both a day-of-week AND a day-of-month parameter in backup rules is currently not implemented by AWS.
- If you enable `enable_continuous_backup`, `cold_storage_after` must not be specified.
- Continuous backups and point-in-time restore (PITR) reference the changes recorded over a period of time; therefore, they cannot be scheduled with a time or cron expression.
- You can store continuous backups for up to 35 days.
- When `move to cold storage` is enabled, delete_after days must be `days set in cold_storage_after` plus `90 days in cold storage or more`.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.11 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.47.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_backup_plan.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/backup_plan) | resource |
| [aws_backup_selection.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/backup_selection) | resource |
| [aws_iam_role.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.backup](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.restore](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backup_rules"></a> [backup\_rules](#input\_backup\_rules) | A list of rules mapping rule configurations for a backup plan | `any` | `[]` | no |
| <a name="input_create_iam_role"></a> [create\_iam\_role](#input\_create\_iam\_role) | Whether to create the IAM Role used to authenticate when restoring and backing up the target resources | `bool` | `true` | no |
| <a name="input_iam_role_arn"></a> [iam\_role\_arn](#input\_iam\_role\_arn) | he ARN of the IAM role that AWS Backup uses to authenticate when restoring and backing up the target resource. | `string` | `null` | no |
| <a name="input_plan_name"></a> [plan\_name](#input\_plan\_name) | (Required) The display name of a backup plan. | `string` | n/a | yes |
| <a name="input_resource_assignments"></a> [resource\_assignments](#input\_resource\_assignments) | A list of maps describing the resource assignments for the backup plan | `any` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Metadata that you can assign to help organize the plans you create. If configured with a provider default\_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the backup plan. |
| <a name="output_create_date"></a> [create\_date](#output\_create\_date) | Creation date of the IAM role. |
| <a name="output_id"></a> [id](#output\_id) | The id of the backup plan. |
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | Amazon Resource Name (ARN) specifying the role. |
| <a name="output_role_name"></a> [role\_name](#output\_role\_name) | Name of the role. |
| <a name="output_tags_all"></a> [tags\_all](#output\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider default\_tags configuration block. |
| <a name="output_unique_id"></a> [unique\_id](#output\_unique\_id) | Stable and unique string identifying the role. |
| <a name="output_version"></a> [version](#output\_version) | Unique, randomly generated, Unicode, UTF-8 encoded string that serves as the version ID of the backup plan. |
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

### Supporting resources:

The example stacks are used by BOLDLink developers to validate the modules by building an actual stack on AWS.

Some of the modules have dependencies on other modules (ex. Ec2 instance depends on the VPC module) so we create them
first and use data sources on the examples to use the stacks.

Any supporting resources will be available on the `tests/supportingResources` and the lifecycle is managed by the `Makefile` targets.

Resources on the `tests/supportingResources` folder are not intended for demo or actual implementation purposes, and can be used for reference.

### Makefile
The makefile contain in this repo is optimized for linux paths and the main purpose is to execute testing for now.
* Create all tests stacks including any supporting resources:
```console
make tests
```
* Clean all tests *except* existing supporting resources:
```console
make clean
```
* Clean supporting resources - this is done separately so you can test your module build/modify/destroy independently.
```console
make cleansupporting
```
* !!!DANGER!!! Clean the state files from examples and test/supportingResources - use with CAUTION!!!
```console
make cleanstatefiles
```


#### BOLDLink-SIG 2024
