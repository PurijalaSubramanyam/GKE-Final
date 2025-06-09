# modules/gke-cluster/main.tf

resource "google_container_cluster" "my_cluster" {
  project  = var.project
  name     = var.cluster_name
  location = var.location
  min_master_version = "1.31.7-gke.1390000"


  remove_default_node_pool = true
  initial_node_count       = 1

   node_config {
    machine_type = "e2-micro"  # Less CPU/RAM
    disk_type    = "pd-standard"  # Use standard persistent disk instead of SSD
    disk_size_gb = 50  # Lower disk size
  }

  network    = var.network_id
  subnetwork = var.subnet_id

  ip_allocation_policy {} # Enable VPC-native clusters

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false  # if false, master has a public IP for admin use
    master_ipv4_cidr_block  = "172.16.0.16/28"  # choose an unused CIDR block in your VPC
  }

#  master_authorized_networks_config {
#   dynamic "cidr_blocks" {
#     for_each = var.master_authorized_networks
#     content {
#       cidr_block   = cidr_blocks.value.cidr_block
#       display_name = cidr_blocks.value.display_name
#     }
#   }
# }


  addons_config {
    http_load_balancing {
      disabled = false
    }

    horizontal_pod_autoscaling {
      disabled = false
    }
  }
}







