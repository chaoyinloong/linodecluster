terraform {
  required_version = ">= 1.0.0"

  required_providers {
    argocd = {
      source = "oboukili/argocd"
      version = "6.0.1"
    }
        
    helm = {
      source  = "hashicorp/helm"
      version = "= 2.5.1"
    }      
  }
}