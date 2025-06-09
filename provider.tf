terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
  required_version = ">= 1.3"
}

provider "google" {
  project     = "famous-plexus-455109-g2" # ✅ Set your GCP project ID
  credentials = file("C:\\Users\\purij\\OneDrive\\Desktop\\sample\\famous-plexus-455109-g2-937851a41f9b.json")
  region      = "us-east1"
  zone        = "us-east1-a"

  # Add timeout settings
  # timeout {
  #  create = "60m"
  # update = "60m"
  #delete = "60m"
  #}
}

