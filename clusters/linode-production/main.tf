module "linode-cluster" {
    source = "../../modules/kubernetes-clusters/linode-cluster"
    
    api_key      = var.linode_api_key
    name         = var.name
    region       = var.region
    node_plan    = var.node_plan
    node_count   = var.node_count
    kube_version = var.kube_version
}

# Attach cluster to Argo
module "argo-cluster" {
    depends_on = [module.linode-cluster]
    source = "../../modules/argocd/cluster"

    argocd_url          = var.argocd_url
    argocd_auth_token   = var.argocd_auth_token

    name                = var.name
    cluster_labels      = var.cluster_labels

    cluster_endpoint    = module.linode-cluster.cluster_endpoint
    ca_data             = module.linode-cluster.ca_data
    bearer_token        = module.linode-cluster.bearer_token
}