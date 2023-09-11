# Cluster configuration
variable "cluster_labels" {
  description = "Labels to assign to ArgoCD cluster"
  type        = map(any)
}

variable "name" {
    description = "Cluster name"
    type        = string
}

# Digital Ocean cluster variables
variable "linode_api_key" {
    description = "Linode API keys"
    type        = string  
}

variable "region" {
    description = "Linode region to deploy cluster to"
    type        = string
   
}

variable "kube_version" {
    description = "Kube Versions"
    type        = string
    default     = "1.26"
}

variable "node_count" {
    description = "Number of worker nodes"
    type        = number
    default     = 1
}

variable "node_plan" {
    description = "Type of node to use"
    type        = string
    default     = "g6-standard-2"
}

# Argo
variable "argocd_url" {
  description = "ArgoCD server URL"
  type        = string
}

variable "argocd_auth_token" {
  description = "ArgoCD automation user token"
  type        = string
}

variable "automation_user" {
  description = "Name of automation user with token for pipeline automation"
  type        = string
  default     = "automation"
}
