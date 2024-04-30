module "backup_vault" {
  source = "./../../modules/vault"
  name   = "${var.name}-vault"
}

module "backup_plan" {
  source    = "./../../"
  plan_name = "${var.name}-plan"
  backup_rules = [
    {
      rule_name         = "${var.name}-rule"
      target_vault_name = module.backup_vault.id[0]
      schedule          = "cron(0 1 ? * * *)"
    },
  ]
}
