terraform {
  backend "gcs" {
    bucket = "terraform-state"
    prefix = "iac-gcp"
  }
}