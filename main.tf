import {
  to = module.compute.google_compute_instance.vm_instance
  id = "projects/${var.project_id}/zones/asia-south1-a/instances/dev-instance"
}


import {
  to = module.networking.google_compute_network.vpc
  id = "projects/${var.project_id}/global/networks/vpc-dev"
}

import {
  to = module.storage.google_storage_bucket.bucket
  id = "dev-system-state" // Bucket name is the ID for GCS buckets
}

module "networking" {
  source     = "./modules/networking"
  project_id = var.project_id
  region     = var.region
  environment = var.environment
}

module "compute" {
    source = "./modules/compute"
    project_id = var.project_id
    zone = var.zone
    instance_name = var.instance_name
}
module "iam" {
    source = "./modules/iam"
    project_id = var.project_id
}

module "storage" {
    source = "./modules/storage"
    project_id = var.project_id
    bucket_name = var.bucket_name
}