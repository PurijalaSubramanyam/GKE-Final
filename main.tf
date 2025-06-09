
# VPC Module
module "vpc" {
  source      = "./modules/vpc"
  vpc_name    = "my-vpc"
  subnet_name = "my-subnet"
  subnet_cidr = "10.10.0.0/16"
  region      = "us-east1"
}

# GKE Cluster Module
module "gke_cluster" {
  source       = "./modules/gke-cluster"
  project      = "famous-plexus-455109-g2"
  cluster_name = "my-gke-cluster"
  location     = "us-east1"
  network_id   = module.vpc.network_id
  subnet_id    = module.vpc.subnet_id

  # master_authorized_networks = [
  #   {
  #     cidr_block   = "49.37.135.191/32"
  #     display_name = "Personal Laptop IP"
  #   },
  #   {
  #     cidr_block   = "10.1.0.0/24"
  #     display_name = "Internal VPC Network"
  #   }
  # ]


}

# GKE Node Pool Module
module "gke_node_pool" {
  source = "./modules/gke-node-pool"

  project        = "famous-plexus-455109-g2"
  cluster_name   = module.gke_cluster.cluster_name
  location       = "us-east1"
  node_pool_name = "primary-node-pool"
  node_count     = 2
  machine_type   = "e2-small" # Use e2-standard instead of e2-medium
  environment    = "dev"
  min_node_count = 1
  max_node_count = 3

  disk_size_gb = 30            # Add disk size limit
  disk_type    = "pd-standard" # Use standard persistent disk (not SSD)
}








