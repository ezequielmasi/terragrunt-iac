locals {

  default = {
    DB_USER = "${random_password.user.result}"
    DB_PASS = "${random_password.password.result}"
  }

}

resource "aws_secretsmanager_secret" "this" {
  name                    = var.secret_name
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "this" {
  secret_id     = aws_secretsmanager_secret.this.id
  secret_string = jsonencode(local.default)
}

resource "random_password" "user" {
  length  = 10
  special = false
  upper   = false
  numeric = false
}

resource "random_password" "password" {
  length           = 18
  special          = true
  upper            = true
  numeric          = true
  override_special = "!#$%&"
}

