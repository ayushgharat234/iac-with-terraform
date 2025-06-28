terraform {
  backend "gcs" {
    bucket = "terraform-state-ayush"
    prefix = "env/prod"
  }
}
