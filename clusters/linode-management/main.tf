
module "linode-cluster" {
    source = "../../modules/kubernetes-clusters/linode-cluster"
    
    api_key      = var.linode_api_key
    name         = var.name
    region       = var.region
    node_plan    = var.node_plan
    node_count   = var.node_count
    kube_version = var.kube_version
}

# There is a small window where the argo-instance fails to connect to the cluster so we add a sleep timer to wait for 5 seconds
resource "time_sleep" "wait_5_seconds" {
    depends_on = [module.linode-cluster]
    create_duration = "5s"
}

resource "random_password" "admin-password" {
  count = var.admin_password == "" ? 1 : 0  
  length  = 16
  special = true
}

# ArgoCD installation
module "argo-instance" {
    depends_on = [time_sleep.wait_5_seconds]
    source = "../../modules/argocd/instance"

    automation_user     = var.automation_user
    admin_password      = local.admin_password

    name                = var.name
    cluster_labels      = var.cluster_labels
    repositories        = var.repositories

    cluster_endpoint    = module.linode-cluster.cluster_endpoint
    ca_data             = module.linode-cluster.ca_data
    bearer_token        = module.linode-cluster.bearer_token
}