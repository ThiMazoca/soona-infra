resource "aws_backup_vault" "main" {
  name = "soona-backup-vault"
}
resource "aws_backup_plan" "main" {
  name = "soona-backup-plan"
  rule {
    rule_name         = "daily-backup"
    target_vault_name = aws_backup_vault.main.name
    schedule          = "cron(0 5 * * ? *)"
    lifecycle {
      delete_after = 30
    }
  }
}
