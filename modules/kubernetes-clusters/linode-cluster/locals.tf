locals {
  kubeconfig_object = yamldecode(base64decode(linode_lke_cluster.cluster.kubeconfig))
}