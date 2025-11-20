variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "network_name" {
  type = string
  default = "gke-network"
}

variable "network_cidr" {
  type    = string
  default = "10.0.0.0/16"
}
