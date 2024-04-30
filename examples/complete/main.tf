module "kms" {
  source                  = "boldlink/kms/aws"
  version                 = "1.2.0"
  description             = "Example kms key"
  alias_name              = "alias/${var.name}-kms"
  create_kms_alias        = true
  deletion_window_in_days = var.deletion_window_in_days
  tags                    = local.tags
}

module "backup_vault" {
  source              = "./../../modules/vault"
  name                = "${var.name}-vault"
  backup_vault_policy = data.aws_iam_policy_document.vault.json
  kms_key_arn         = module.kms.arn
  tags                    = local.tags
}

module "backup_plan" {
  source    = "./../../"
  plan_name = "${var.name}-vault"
  backup_rules = [
    {
      rule_name         = "${var.name}-rule"
      target_vault_name = module.backup_vault.id[0]
    },
  ]
  tags                    = local.tags
}
