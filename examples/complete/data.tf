data "aws_caller_identity" "current" {}

data "aws_partition" "current" {}

data "aws_iam_policy_document" "vault" {
  statement {
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["arn:${local.partition}:iam::${local.account_id}:root"]
    }

    actions = [
      "backup:DescribeBackupVault",
      "backup:PutBackupVaultAccessPolicy",
      "backup:GetBackupVaultAccessPolicy",
      "backup:StartBackupJob",
      "backup:GetBackupVaultNotifications",
      "backup:PutBackupVaultNotifications",
      "backup:DeleteBackupVault",
      "backup:DeleteBackupVaultAccessPolicy",
    ]
    resources = module.backup_vault.arn
  }
}
