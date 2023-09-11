output "automation_user_token" {
    value = argocd_account_token.automation-user-token.jwt
    sensitive = true
}

output "admin_password" {
    value = var.admin_password
    sensitive = true
}