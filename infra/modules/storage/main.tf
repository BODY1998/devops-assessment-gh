resource "google_storage_bucket" "logs" {
  name          = var.logs_bucket
  project       = var.project_id
  location      = var.region
  force_destroy = true

  uniform_bucket_level_access = true
}

resource "google_storage_bucket" "static" {
  name          = var.static_bucket
  project       = var.project_id
  location      = var.region
  force_destroy = true

  uniform_bucket_level_access = true
}
