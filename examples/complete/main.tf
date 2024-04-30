module "backup_vault" {
  source              = "./../../modules/vault"
  name                = "${var.name}-vault"
  backup_vault_policy = data.aws_iam_policy_document.vault.json
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
}
