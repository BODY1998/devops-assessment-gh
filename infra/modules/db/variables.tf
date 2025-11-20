variable "namespace" {
  type    = string
  default = "db"
}

variable "release_name" {
  type    = string
  default = "postgres"
}

variable "postgresql_database" {
  type    = string
  default = "appdb"
}

variable "postgresql_username" {
  type    = string
  default = "appuser"
}

variable "postgresql_password" {
  type      = string
  sensitive = true
}

variable "persistence_size" {
  type    = string
  default = "10Gi"
  description = "Persistent volume size for Postgres."
}

variable "image_tag" {
  type    = string
  default = "15.4.0" 
}

variable "resources" {
  type = map(any)
  default = {
    requests = { cpu = "250m", memory = "256Mi" }
    limits   = { cpu = "500m", memory = "512Mi" }
  }
}
