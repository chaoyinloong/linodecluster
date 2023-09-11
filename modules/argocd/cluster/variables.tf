# ArgoCD 
variable "argocd_url" {
  description = "ArgoCD server URL"
  type        = string
}

variable "argocd_auth_token" {
  description = "ArgoCD automation user token"
  type        = string
}

# Cluster access
variable "cluster_endpoint" {
  description = "Cluster's endpoint IP/URL"
  sensitive   = true
}

variable "ca_data" {
  description = "CA data"
  sensitive   = true
}

variable "bearer_token" {
  description = "Bearer token"
  default     = ""
  sensitive   = true
}

variable "user_cert_data" {
  description = "User certificate data"
  default     = ""
  sensitive   = true
}

variable "user_cert_key" {
  description = "User certificate key"
  default     = ""
  sensitive   = true
}

# Cluster configuration
variable "name" {
  description = "New cluster name"
  type        = string
}

variable "cluster_labels" {
  description = "Labels to assign to ArgoCD cluster"
  type        = map(any)
}