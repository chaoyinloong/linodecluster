resource "argocd_cluster" "kubernetes" {
  server  = var.cluster_endpoint
  name    = var.name 

  config {

    bearer_token = var.bearer_token != "" ? var.bearer_token : ""

    tls_client_config {
      ca_data   = var.ca_data

      cert_data = var.user_cert_data != "" ? var.user_cert_data : ""
      key_data  = var.user_cert_key != "" ? var.user_cert_key : ""
    }
  }

  metadata {
    labels = var.cluster_labels
  }
}