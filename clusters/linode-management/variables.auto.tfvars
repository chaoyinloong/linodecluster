name         = "linode-management"
region       = "ap-south"
node_plan    = "g6-standard-2"
kube_version = "1.26"
node_count   = 3

cluster_labels = {
  global     = "true"
  management = "true"
}

# Argo repositories
repositories = [
  {
    name       = "management"
    repository = "https://github.com/chaoyinloong/management-applications.git"
    label      = {
      management = "true"
    }
  },
  {
    name       = "global"
    repository = "https://github.com/chaoyinloong/global-applications.git"
    label      = {
      global = "true"
    }
  },
  {
    name       = "production"
    repository = "https://github.com/chaoyinloong/production-applications.git"
    label      = {
      production = "true"
    }
  }    
]