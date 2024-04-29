resource "aws_backup_plan" "main" {
  name = var.plan_name
  dynamic "rule" {
    for_each = var.backup_rules
    content {
      rule_name                = lookup(rule.value, "name", rule.key)
      target_vault_name        = lookup(rule.value, "target_vault_name")
      schedule                 = lookup(rule.value, "schedule", null)
      enable_continuous_backup = lookup(rule.value, "enable_continuous_backup", null)
      start_window             = lookup(rule.value, "start_window", null)
      completion_window        = lookup(rule.value, "completion_window", null)
      dynamic "lifecycle" {
        for_each = lookup(rule.value, "lifecycle", null) == null ? [] : [true]
        content {
          cold_storage_after = lookup(lifecycle.value, "cold_storage_after", null)
          delete_after       = lookup(lifecycle.value, "delete_after", null)
        }
      }
    }
  }
  tags = var.tags
}

resource "aws_iam_role" "main" {
  count              = var.create_iam_role ? 1 : 0
  name               = "${var.plan_name}-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "main" {
  count      = var.create_iam_role ? 1 : 0
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
  role       = aws_iam_role.main[0].name
}

resource "aws_backup_selection" "main" {
  count         = var.create_backup_selection ? 1 : 0
  plan_id       = aws_backup_plan.main.id
  iam_role_arn  = var.create_iam_role ? aws_iam_role.main[0].arn : var.iam_role_arn
  name          = "${var.plan_name}-assignment"
  resources     = var.resources
  not_resources = var.not_resources
  dynamic "selection_tag" {
    for_each = var.selection_tags
    content {
      type  = lookup(selection_tag.value, "type", null)
      key   = lookup(selection_tag.value, "key", null)
      value = lookup(selection_tag.value, "value", null)
    }
  }
}
