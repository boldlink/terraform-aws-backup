module "kms" {
  #checkov:skip=CKV_TF_1 #"Ensure Terraform module sources use a commit hash"
  source                  = "boldlink/kms/aws"
  version                 = "1.2.0"
  description             = "Example kms key"
  alias_name              = "alias/${var.name}-kms"
  create_kms_alias        = true
  deletion_window_in_days = var.deletion_window_in_days
  tags                    = merge({ Name = "${var.name}-kms" }, var.tags)
}

module "sns_topic" {
  #checkov:skip=CKV_TF_1 #"Ensure Terraform module sources use a commit hash"
  source = "boldlink/sns/aws"
  name   = "${var.name}-topic"
  tags   = merge({ Name = "${var.name}-topic" }, var.tags)
}

module "backup_vault" {
  source              = "./../../modules/vault"
  name                = "${var.name}-vault"
  backup_vault_policy = data.aws_iam_policy_document.vault.json
  kms_key_arn         = module.kms.arn
  force_destroy       = var.force_destroy
  sns_notify          = var.sns_notify
  create_backup_vault_policy = var.create_backup_vault_policy
  sns_topic_arn       = module.sns_topic.arn
  backup_vault_events = var.backup_vault_events
  tags                = merge({ Name = "${var.name}-vault" }, var.tags)
}

module "backup_plan" {
  source    = "./../../"
  plan_name = "${var.name}-plan"
  backup_rules = [
    {
      rule_name           = "${var.name}-rule"
      target_vault_name   = module.backup_vault.id[0]
      schedule            = "cron(20 0/1 ? * * *)"
      start_window        = 60
      completion_window   = 120
      recovery_point_tags = merge({ Name = "${var.name}-rule" }, var.tags)
      lifecycle = {
        delete_after = 30
      }
    },
    {
      rule_name                = "${var.name}-continous-rule"
      target_vault_name        = module.backup_vault.id[0]
      schedule                 = "cron(0 1 ? * * *)"
      enable_continuous_backup = true
      start_window             = 60
      completion_window        = 120
      recovery_point_tags      = merge({ Name = "${var.name}-continous-rule" }, var.tags)
      lifecycle = {
        delete_after = 35 #Maximum
      }
    },
  ]
  resource_assignments = [
    {
      name      = "${var.name}-resource-assignment1"
      resources = ["arn:aws:ec2:*:*:instance/*"]
      selection_tag = [
        {
          type  = "STRINGEQUALS"
          key   = "aws:ResourceTag/backup"
          value = true
        }
      ]
    },
    {
      name      = "${var.name}-resource-assignment2"
      resources = ["arn:aws:rds:*:*:cluster:*"]
    }
  ]
  tags = merge({ Name = "${var.name}-plan" }, var.tags)
}

## Cold Storage
module "cold_storage_plan" {
  source    = "./../../"
  plan_name = "${var.name}-cold-storage-plan"
  backup_rules = [
    {
      rule_name         = "${var.name}-cold-storage-rule"
      target_vault_name = module.backup_vault.id[0]
      schedule          = "cron(0 1 ? * * *)"
      start_window      = 480
      completion_window = 10080
      lifecycle = {
        cold_storage_after = 7
        delete_after       = 100
      }
    },
  ]
  resource_assignments = [
    {
      name      = "${var.name}-resource-assignment1"
      resources = ["*"]
    }
  ]
  tags = merge({ Name = "${var.name}-cold-storage-plan" }, var.tags)
}
