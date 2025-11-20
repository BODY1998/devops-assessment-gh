terraform {
  required_version = ">= 1.5.0"

  backend "gcs" {
    bucket = "tfstate-bucket-candidate-2"
    prefix = "terraform/state-candidate-2"
  }
}
