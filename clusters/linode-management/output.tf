output "kubeconfig" {
    value = module.linode-cluster.kubeconfig
    sensitive = true
}

output "automation_user_token" {
    value = module.argo-instance.automation_user_token
    sensitive = true
}

output "admin_password" {
    value = local.admin_password
    sensitive = true
}