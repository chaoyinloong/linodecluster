# The url of our ArgoCD installation on the management cluster
argocd_url   = "argocd.infotech-asia.com"

# Cluster name
name         = "linode-production"

# Cluster labels to apply to this cluster
cluster_labels = {
  global      = "true"
  production  = "true"
}

# Linode cluster variables
region       = "ap-south"
node_plan    = "g6-standard-2"
kube_version = "1.26"
node_count   = 1