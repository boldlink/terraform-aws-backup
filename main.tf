resource "aws_backup_plan" "main" {
  name = var.plan_name
  dynamic "rule" {
    for_each = var.backup_rules
    content {
      rule_name                = lookup(rule.value, "rule_name", )
      target_vault_name        = lookup(rule.value, "target_vault_name")
      schedule                 = lookup(rule.value, "schedule")
      enable_continuous_backup = lookup(rule.value, "enable_continuous_backup", null)
      start_window             = lookup(rule.value, "start_window", null)
      completion_window        = lookup(rule.value, "completion_window", null)
      dynamic "lifecycle" {
        for_each = lookup(rule.value, "lifecycle", null) == null ? [] : [true]
        content {
          cold_storage_after = lookup(rule.value, "enable_continuous_backup", null) == null ? lookup(rule.value.lifecycle, "cold_storage_after", null) : null
          delete_after       = lookup(rule.value.lifecycle, "delete_after", null)
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
  count         = length(var.resource_assignments) > 0 ? length(var.resource_assignments) : 0
  plan_id       = aws_backup_plan.main.id
  iam_role_arn  = var.create_iam_role ? aws_iam_role.main[0].arn : var.iam_role_arn
  name          = var.resource_assignments[count.index]["name"]
  resources     = try(var.resource_assignments[count.index]["resources"], null)
  not_resources = try(var.resource_assignments[count.index]["not_resources"], null)
  dynamic "selection_tag" {
    for_each = lookup(var.resource_assignments[count.index], "selection_tag", {})
    content {
      type  = selection_tag.value.type
      key   = selection_tag.value.key
      value = selection_tag.value.value
    }
  }
}
