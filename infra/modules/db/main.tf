# Namespace
resource "kubernetes_namespace" "db" {
  metadata {
    name = var.namespace
    labels = {
      app = "postgres"
    }
  }
}

# Helm release (Bitnami PostgreSQL)
resource "helm_release" "postgres" {
  name       = var.release_name
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "postgresql"
  namespace  = kubernetes_namespace.db.metadata[0].name
  create_namespace = false

  # Values passed to the chart
  values = [
    yamlencode({
      global = {
        imageRegistry = ""
      }
      postgresql = {
        postgresqlDatabase = var.postgresql_database
        postgresqlUsername = var.postgresql_username
        postgresqlPassword = var.postgresql_password
      }
      persistence = {
        enabled = true
        size    = var.persistence_size
      }
      primary = {
        resources = var.resources
      }
      replica = {
        replicaCount = 1
      }
      service = {
        type = "ClusterIP"
      }
    })
  ]

  depends_on = [kubernetes_namespace.db]
}
