# Cluster access
variable "cluster_endpoint" {
  description = "Cluster's endpoint IP/URL"
  sensitive   = true
}

variable "ca_data" {
  description = "CA data"
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

variable "bearer_token" {
  description = "Cluster bearer token"
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

# ArgoCD
variable "admin_password" {
  description = "Password to set for the admin user"
  type        = string
  sensitive   = true
}

variable "automation_user" {
  description = "Name of automation user with token for pipeline automation"
  type        = string
  default     = "automation"
}

variable "repositories" {
  description = "List of maps with repository details"
  type = list(object({
    name       = string
    repository = string
    label      = map(any)
  }))
}