output "namespace" {
  value = kubernetes_namespace.db.metadata[0].name
}

output "release_name" {
  value = helm_release.postgres.name
}

output "postgres_service" {
  value = "${helm_release.postgres.name}.${kubernetes_namespace.db.metadata[0].name}.svc.cluster.local"
}

output "connection_string" {
  value = "postgresql://${var.postgresql_username}:${var.postgresql_password}@${helm_release.postgres.name}.${kubernetes_namespace.db.metadata[0].name}.svc.cluster.local:5432/${var.postgresql_database}"
  sensitive = true
}
