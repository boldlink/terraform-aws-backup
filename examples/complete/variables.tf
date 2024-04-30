variable "name" {
  description = "The display name of the stack."
  type        = string
  default     = "Example-complete-backup"
}

variable "deletion_window_in_days" {
  description = " The waiting period, specified in number of days. After the waiting period ends, AWS KMS deletes the KMS key. If you specify a value, it must be between 7 and 30, inclusive. If you do not specify a value, it defaults to 30. If the KMS key is a multi-Region primary key with replicas, the waiting period begins when the last of its replica keys is deleted. Otherwise, the waiting period begins immediately."
  type        = number
  default     = 7
}

variable "tags" {
  description = "(Optional) Metadata that you can assign to help organize the resources that you create. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  type        = map(string)
  default     = {
    Environment        = "examples"
    Project            = "terraform-modules"
    "user::CostCenter" = "terraform"
    Department         = "devops"
    LayerName          = "Exampls"
    LayerId            = "Examples"
    Owner              = "Boldlink"
  }
}
