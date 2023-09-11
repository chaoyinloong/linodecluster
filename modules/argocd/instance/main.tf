# Install Argocd using a helm chart
resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  create_namespace = true
  version          = "5.36.5"
  values           = [
    templatefile("${path.module}/instance-values.tftpl", {
      AUTOMATION_USER = var.automation_user
      CLUSTER_NAME    = var.name
      CLUSTER_LABELS  = var.cluster_labels
      CA_DATA         = base64encode(var.ca_data)
      CERT_DATA       = var.user_cert_data  != "" ? base64encode(var.user_cert_data) : ""
      KEY_DATA        = var.user_cert_key   != "" ? base64encode(var.user_cert_key) : ""
      TOKEN           = var.bearer_token    != "" ? var.bearer_token : ""
      ADMIN_PASSWORD  = bcrypt(var.admin_password)
    })
  ]
}

# Configure our applications ass applicationsets in Argocd
resource "helm_release" "applicationsets" {
  depends_on = [helm_release.argocd]
  name             = "applicationsets"
  chart            = "${path.module}/applicationset-chart"
  namespace        = "argocd"
  values           = [
    templatefile("${path.module}/applicationsets-values.tftpl", {
      REPOSITORIES = var.repositories
    })
  ]
}

# Generate account token used for pipeline automation
resource "argocd_account_token" "automation-user-token" {
    depends_on = [helm_release.argocd]
    
    account = var.automation_user
}