terraform {
  required_providers {
    linode = {
      source = "linode/linode"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "= 2.5.1"
    }    

    argocd = {
      source = "oboukili/argocd"
      version = "6.0.1"
    }
  }
}

# DigitalOcean provider
provider "linode" {
  token = var.linode_api_key

}

# Helm provider with our cluster details
provider "helm" {
    kubernetes {
        host     = module.linode-cluster.cluster_endpoint

        token                  = module.linode-cluster.bearer_token
        cluster_ca_certificate = module.linode-cluster.ca_data
    }
}

# ArgoCD provider for argo administration
provider "argocd" {
    username     = "admin"
    password     = local.admin_password

    port_forward_with_namespace = "argocd"

    kubernetes {
        host     = module.linode-cluster.cluster_endpoint

        token                  = module.linode-cluster.bearer_token
        cluster_ca_certificate = module.linode-cluster.ca_data
    }
}