terraform {
  required_providers {
    argocd = {
      source = "oboukili/argocd"
      version = "6.0.1"
    }

    linode = {
      source = "linode/linode"
      #version = "~> 2.0"
    }
  }
}

# ArgoCD provider 
provider "argocd" {
  server_addr = var.argocd_url
  auth_token  = var.argocd_auth_token
  grpc_web    = true
}

# Linode provider
provider "linode" {
  token = var.linode_api_key
}