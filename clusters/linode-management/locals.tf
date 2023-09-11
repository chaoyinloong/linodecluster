locals {
  admin_password = var.admin_password != "" ? var.admin_password : random_password.admin-password[0].result
}