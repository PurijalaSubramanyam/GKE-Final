# modules/gke-cluster/variables.tf

variable "project" {
  description = "The Google Cloud project ID"
  type        = string
}

variable "cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
}

variable "location" {
  description = "The location/region for the GKE cluster"
  type        = string
}

variable "network_id" {
  description = "The network ID where the GKE cluster will be created"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID where the GKE cluster will be created"
  type        = string
}


variable "master_authorized_networks" {
  description = "List of CIDR blocks authorized to access the Kubernetes master endpoint"
  type = list(object({
    cidr_block   = string
    display_name = string
  }))
  default = []
}