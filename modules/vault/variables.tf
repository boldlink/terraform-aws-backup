variable "create_backup_vault" {
  description = "Whether to create AWS backup Vault or not"
  type        = bool
  default     = true
}

variable "name" {
  description = "(Required) Name of the backup vault to create."
  type        = string
}

variable "kms_key_arn" {
  description = "(Optional) The server-side encryption key that is used to protect your backups."
  type        = string
  default     = null
}

variable "force_destroy" {
  description = "(Optional, Default: false) A boolean that indicates that all recovery points stored in the vault are deleted so that the vault can be destroyed without error."
  type        = bool
  default     = false
}

variable "tags" {
  description = "(Optional) Metadata that you can assign to help organize the resources that you create. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  type        = map(string)
  default     = {}
}

variable "create_backup_vault_policy" {
  description = "Whether to create AWS backup Vault policy or not"
  type        = bool
  default     = false
}

variable "backup_vault_policy" {
  description = "The backup vault access policy document in JSON format."
  type        = string
  default     = ""
}

variable "backup_vault_events" {
  description = "An array of events that indicate the status of jobs to back up resources to the backup vault."
  type        = list(string)
  default     = []
}

variable "sns_notify" {
  description = "Whether to create AWS Backup vault notifications resource."
  type        = bool
  default     = false
}

variable "sns_topic_arn" {
  description = "The Amazon Resource Name (ARN) that specifies the topic for a backup vault’s events"
  type        = string
  default     = ""
}
