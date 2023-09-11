output "kubeconfig" {
  #value = linode_lke_cluster.cluster.kubeconfig.0.raw_config
  #value = linode_lke_cluster.cluster.kubeconfig
  value = "${nonsensitive(base64decode(linode_lke_cluster.cluster.kubeconfig))}"
  sensitive = true
}

output "cluster_endpoint" {
  value = local.kubeconfig_object.clusters[0].cluster.server
  sensitive = true
}

output "ca_data" {
  value = base64decode(local.kubeconfig_object.clusters[0].cluster.certificate-authority-data)
  sensitive = true
}

output "bearer_token" {
  value = local.kubeconfig_object.users[0].user.token
  sensitive = true
}