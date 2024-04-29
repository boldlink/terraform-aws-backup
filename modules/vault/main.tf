resource "aws_backup_vault" "main" {
  count         = var.create_backup_vault ? 1 : 0
  name          = var.name
  kms_key_arn   = var.kms_key_arn
  force_destroy = var.force_destroy
  tags          = var.tags
}

resource "aws_backup_vault_policy" "main" {
  count             = var.create_backup_vault && var.aws_backup_vault_policy != "" ? 1 : 0
  backup_vault_name = aws_backup_vault.main[0].name
  policy            = var.aws_backup_vault_policy
}

resource "aws_backup_vault_notifications" "main" {
  count               = var.create_backup_vault && var.sns_topic_arn != null ? 1 : 0
  backup_vault_name   = aws_backup_vault.main[0].name
  sns_topic_arn       = var.sns_topic_arn
  backup_vault_events = var.backup_vault_events
}
