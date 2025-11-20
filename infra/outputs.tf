output "gke_cluster_name" {
  value = module.gke.cluster_name
}

output "gke_endpoint" {
  value = module.gke.endpoint
}

output "logs_bucket" {
  value = module.gcs_buckets.logs_bucket
}

output "static_bucket" {
  value = module.gcs_buckets.static_bucket
}

output "artifact_registry_repo" {
  value = module.artifact_registry.repo_id
}
