module "network" {
  source       = "./modules/gke-network"
  project_id   = var.project_id
  region       = var.region
  network_name = var.network_name
}

module "gke" {
  source              = "./modules/gke"
  project_id          = var.project_id
  region              = var.region
  network             = module.network.network_self_link
  subnetwork          = module.network.subnetwork_self_link
  cluster_name        = "gke-cluster"
  node_count          = var.gke_node_count
  machine_type        = var.gke_machine_type
  pods_ip_range_name  = module.network.pods_ip_range_name
  svc_ip_range_name   = module.network.svc_ip_range_name
}

module "gcs_buckets" {
  source = "./modules/storage"

  project_id    = var.project_id
  region        = var.region
  logs_bucket   = var.logs_bucket
  static_bucket = var.static_bucket
}

module "artifact_registry" {
  source        = "./modules/artifact_registry"
  project_id    = var.project_id
  region        = var.region
  repo_name     = "app-artifact-repo"
}

module "db" {
  source               = "./modules/db"
  namespace            = "db"
  release_name         = "postgres"
  postgresql_database  = "appdb"
  postgresql_username  = "appuser"
  postgresql_password  = var.postgresql_password
  persistence_size     = "10Gi"
  depends_on = [module.gke]
}
