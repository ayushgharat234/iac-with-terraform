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

module "compute" {
    source = "../../modules/compute"
    instance_count = 2
    name_prefix = "dev"
    machine_type = "e2-medium"
    zone = var.zone
    subnet_self_link = module.network.subnet_self_link
    startup_script   = file("${path.module}/startup.sh")
    tags = ["web"]
}

module "iam" {
    source = "../../modules/iam"
    project_id = var.project_id
    member_email = var.member_email
    member_type = "user"
    roles = [
        "roles/compute.viewer",
        "roles/iam.securityReviewer",
        "roles/logging.viewer"
    ]
}

module "monitoring" {
    source = "../../modules/monitoring"
    notification_channel_id = var.notification_channel_id
}

module "budget" {
  source = "../../modules/budget"
  billing_account_id = var.billing_account_id
  pubsub_topic = var.pubsub_topic
  budget_amount = 20
}

resource "google_storage_bucket" "bucket" {
  name     = "terraform-state-ayush"
  location = var.region
  project  = var.project_id

  versioning {
    enabled = true
  }
}