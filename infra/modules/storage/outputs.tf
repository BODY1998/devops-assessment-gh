output "logs_bucket" {
  value = google_storage_bucket.logs.name
}

output "static_bucket" {
  value = google_storage_bucket.static.name
}
