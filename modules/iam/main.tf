# modules/iam/main.tf

resource "google_service_account" "gke_sa" {
  project      = var.project
  account_id   = "gke-node-sa"
  display_name = "GKE Node Service Account"
}
