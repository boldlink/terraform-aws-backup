variable "plan_name" {
  description = "(Required) The display name of a backup plan."
  type        = string
}

variable "backup_rules" {
  description = "A list of rules mapping rule configurations for a backup plan"
  type        = any
  default     = []
}

variable "tags" {
  description = "(Optional) Metadata that you can assign to help organize the plans you create. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  type        = map(string)
  default     = {}
}

variable "create_iam_role" {
  description = "Whether to create the IAM Role used to authenticate when restoring and backing up the target resources"
  type        = bool
  default     = true
}

variable "iam_role_arn" {
  description = "he ARN of the IAM role that AWS Backup uses to authenticate when restoring and backing up the target resource."
  type        = string
  default     = null
}

variable "create_backup_selection" {
  description = "Whether to create backup selection resource or not"
  type        = bool
  default     = false
}

variable "resources" {
  description = "(Optional) An array of strings that either contain Amazon Resource Names (ARNs) or match patterns of resources to assign to a backup plan."
  type        = list(string)
  default     = []
}

variable "not_resources" {
  description = "(Optional) An array of strings that either contain Amazon Resource Names (ARNs) or match patterns of resources to exclude from a backup plan."
  type        = list(string)
  default     = []
}

variable "selection_tags" {
  description = "A list of selection tags map"
  type        = list(any)
  default     = []
}
