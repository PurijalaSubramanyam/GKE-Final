# modules/gke-node-pool/variables.tf

variable "project" {
  description = "The Google Cloud project ID"
  type        = string
}

variable "cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
}

variable "location" {
  description = "The location/region for the GKE node pool"
  type        = string
}

variable "node_pool_name" {
  description = "The name of the node pool"
  type        = string
}

variable "node_count" {
  description = "The initial number of nodes in the pool"
  type        = number
}

variable "machine_type" {
  description = "The machine type for the node pool"
  type        = string
}


variable "environment" {
  description = "Environment label for the node pool"
  type        = string
}

variable "min_node_count" {
  description = "Minimum number of nodes in the pool"
  type        = number
}

variable "max_node_count" {
  description = "Maximum number of nodes in the pool"
  type        = number
}

variable "disk_size_gb" {
  description = "The size of the disk attached to each node, specified in GB."
  type        = number
  default     = 100
}

variable "disk_type" {
  description = "The type of disk to use for each node (pd-standard or pd-ssd)."
  type        = string
  default     = "pd-standard"
}
