# General variables
variable "name" {
    description = "Cluster name"
    type        = string
}

variable "cluster_labels" {
  description = "Labels to assign to ArgoCD cluster"
  type        = map(any)
}

# Management variables
variable "repositories" {
  description = "List of maps with repository details"
  type = list(object({
    name       = string
    repository = string
    label      = map(any)
  }))
}

variable "automation_user" {
  description = "Name of automation user with token for our pipeline automation"
  type        = string
  default     = "automation"
}

variable "admin_password" {
  description = "Password to set for the admin user"
  type        = string
  default     = ""
  sensitive   = true
}

# Linode cluster variables
variable "linode_api_key" {
    description = "Linode API key"
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
    default     = 3
}

variable "node_plan" {
    description = "Type of node to use"
    type        = string
    default     = "g6-standard-2"
}