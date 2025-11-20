terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.19.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.27"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "3.1.1"
    }
  }

  required_version = ">= 1.5.0"
}

provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = file("D:/Assesment/candidate-2-key.json")
}

data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  cluster_ca_certificate = base64decode(module.gke.cluster_ca_certificate)
  token                  = data.google_client_config.default.access_token
}

provider "helm" {
  kubernetes = {
    host                   = "https://${module.gke.endpoint}"
    cluster_ca_certificate = base64decode(module.gke.cluster_ca_certificate)
    token                  = data.google_client_config.default.access_token
  }
}
