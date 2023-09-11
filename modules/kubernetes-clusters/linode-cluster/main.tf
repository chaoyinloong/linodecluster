resource "linode_lke_cluster" "cluster" {
  label   = var.name
  k8s_version = var.kube_version
  region  = var.region
  tags = ["prod"]

  pool {
    count = var.node_count
    type  = var.node_plan
    #name = "${var.name}-pool"
  }
}