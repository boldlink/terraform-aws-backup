output "id" {
  description = "The id of the backup plan."
  value       = aws_backup_plan.main.id
}

output "arn" {
  description = "The ARN of the backup plan."
  value       = aws_backup_plan.main.arn
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = aws_backup_plan.main.tags_all
}

output "version" {
  description = "Unique, randomly generated, Unicode, UTF-8 encoded string that serves as the version ID of the backup plan."
  value       = aws_backup_plan.main.version
}

output "role_arn" {
  description = "Amazon Resource Name (ARN) specifying the role."
  value       = aws_iam_role.main[*].arn
}

output "role_name" {
  description = "Name of the role."
  value       = aws_iam_role.main[*].name
}

output "create_date" {
  description = "Creation date of the IAM role."
  value       = aws_iam_role.main[*].create_date
}

output "unique_id" {
  description = "Stable and unique string identifying the role."
  value       = aws_iam_role.main[*].unique_id
}
