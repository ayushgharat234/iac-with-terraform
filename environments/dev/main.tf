provider "google" {
  project = var.project_id
  region = var.region
}

module "network" {
    source = "../../modules/network"
    network_name = var.network_name
    cidr_block = var.cidr_block
    region = var.region
}

