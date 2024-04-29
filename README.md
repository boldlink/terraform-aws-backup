[![License](https://img.shields.io/badge/License-Apache-blue.svg)](https://github.com/boldlink/terraform-module-template/blob/main/LICENSE)
[![Latest Release](https://img.shields.io/github/release/boldlink/terraform-module-template.svg)](https://github.com/boldlink/terraform-module-template/releases/latest)
[![Build Status](https://github.com/boldlink/terraform-module-template/actions/workflows/update.yaml/badge.svg)](https://github.com/boldlink/terraform-module-template/actions)
[![Build Status](https://github.com/boldlink/terraform-module-template/actions/workflows/release.yaml/badge.svg)](https://github.com/boldlink/terraform-module-template/actions)
[![Build Status](https://github.com/boldlink/terraform-module-template/actions/workflows/pre-commit.yaml/badge.svg)](https://github.com/boldlink/terraform-module-template/actions)
[![Build Status](https://github.com/boldlink/terraform-module-template/actions/workflows/pr-labeler.yaml/badge.svg)](https://github.com/boldlink/terraform-module-template/actions)
[![Build Status](https://github.com/boldlink/terraform-module-template/actions/workflows/module-examples-tests.yaml/badge.svg)](https://github.com/boldlink/terraform-module-template/actions)
[![Build Status](https://github.com/boldlink/terraform-module-template/actions/workflows/checkov.yaml/badge.svg)](https://github.com/boldlink/terraform-module-template/actions)
[![Build Status](https://github.com/boldlink/terraform-module-template/actions/workflows/auto-merge.yaml/badge.svg)](https://github.com/boldlink/terraform-module-template/actions)
[![Build Status](https://github.com/boldlink/terraform-module-template/actions/workflows/auto-badge.yaml/badge.svg)](https://github.com/boldlink/terraform-module-template/actions)

[<img src="https://avatars.githubusercontent.com/u/25388280?s=200&v=4" width="96"/>](https://boldlink.io)

# AWS Backup Terraform Module

## Description

AWS Backup is a fully-managed service that makes it easy to centralize and automate data protection across AWS services, in the cloud, and on premises.

This terraform module creates a Backup vault, backup plan and the associated resources in AWS.

Examples available [`here`](https://github.com/boldlink/terraform-aws-backup/tree/main/examples)

## Usage
*NOTE*: These examples use the latest version of this module

```console
module "miniumum" {
  source  = "boldlink/<module_name>/<provider>"
  version = "x.x.x"
  <insert the minimum required variables here if any are required>
  ...
}
```
## Documentation

[AWS Backup Documentation](https://docs.aws.amazon.com/aws-backup/latest/devguide/whatisbackup.html)

[Terraform module documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/backup_plan)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.11 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.47.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.47.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_backup_plan.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/backup_plan) | resource |
| [aws_backup_selection.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/backup_selection) | resource |
| [aws_iam_role.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backup_rules"></a> [backup\_rules](#input\_backup\_rules) | A list of rules mapping rule configurations for a backup plan | `any` | `[]` | no |
| <a name="input_create_iam_role"></a> [create\_iam\_role](#input\_create\_iam\_role) | Whether to create the IAM Role used to authenticate when restoring and backing up the target resources | `bool` | `true` | no |
| <a name="input_iam_role_arn"></a> [iam\_role\_arn](#input\_iam\_role\_arn) | he ARN of the IAM role that AWS Backup uses to authenticate when restoring and backing up the target resource. | `string` | `null` | no |
| <a name="input_not_resources"></a> [not\_resources](#input\_not\_resources) | (Optional) An array of strings that either contain Amazon Resource Names (ARNs) or match patterns of resources to exclude from a backup plan. | `list(string)` | `[]` | no |
| <a name="input_plan_name"></a> [plan\_name](#input\_plan\_name) | (Required) The display name of a backup plan. | `string` | n/a | yes |
| <a name="input_resources"></a> [resources](#input\_resources) | (Optional) An array of strings that either contain Amazon Resource Names (ARNs) or match patterns of resources to assign to a backup plan. | `list(string)` | `[]` | no |
| <a name="input_selection_tags"></a> [selection\_tags](#input\_selection\_tags) | A list of selection tags map | `list(any)` | `[]` | no |

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
