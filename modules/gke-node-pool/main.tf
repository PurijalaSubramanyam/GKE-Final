# modules/gke-node-pool/main.tf

resource "google_container_node_pool" "primary_nodes" {
  project    = var.project
  name       = var.node_pool_name
  location   = var.location
  cluster    = var.cluster_name
  node_count = var.node_count

  node_config {
    preemptible     = false
    machine_type = var.machine_type
    disk_size_gb = var.disk_size_gb
    disk_type    = var.disk_type
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
    labels = {
      env = var.environment
    }

    metadata = {
      disable-legacy-endpoints = "true"
    }

    tags = ["gke-node"]

    
  }

  autoscaling {
    min_node_count = var.min_node_count
    max_node_count = var.max_node_count
  }

  management {
    auto_upgrade = true
    auto_repair  = true
  }
}


