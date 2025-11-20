resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region
  project  = var.project_id

  network    = var.network
  subnetwork = var.subnetwork

  remove_default_node_pool = true
  initial_node_count       = 1

  ip_allocation_policy {
    cluster_secondary_range_name  = var.pods_ip_range_name
    services_secondary_range_name = var.svc_ip_range_name
  }

  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }
}

resource "google_container_node_pool" "default" {
  name     = "${var.cluster_name}-pool"
  cluster  = google_container_cluster.primary.name
  location = var.region
  project  = var.project_id

  # initial_node_count = var.node_count
  initial_node_count = 1

  node_config {
    machine_type = var.machine_type
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    disk_type    = "pd-standard"
    disk_size_gb = 20
    labels = {
      env = "assessment"
    }
  }
}
