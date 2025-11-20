variable "project_id" {
  type        = string
  description = "GCP project ID"
}

variable "region" {
  type        = string
  default     = "us-central1"
  description = "Primary region for all resources"
}

variable "gke_node_count" {
  type    = number
  default = 1
}

variable "gke_machine_type" {
  type    = string
  default = "e2-medium"
}

variable "network_name" {
  type    = string
  default = "devops-vpc"
}

variable "logs_bucket" {
  type = string
}

variable "static_bucket" {
  type = string
}

variable "postgresql_password" {
  type      = string
  sensitive = true
}
