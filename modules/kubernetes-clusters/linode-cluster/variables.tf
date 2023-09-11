variable "api_key" {
    description = "Linode API key"
    type        = string  
}

variable "region" {
    description = "Region to deploy cluster to"
    type        = string

}

variable "name" {
    description = "Cluster name"
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