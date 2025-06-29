import {
  to = module.compute.google_compute_instance.vm_instance
  id = "projects/${var.project_id}/zones/${var.zone}/instances/${var.instance_name}"
}

import {
  to = module.networking.google_compute_network.vpc
  id = "projects/${var.project_id}/global/networks/vpc-${var.environment}"
}

import {
  to = module.storage.google_storage_bucket.bucket
  id = var.bucket_name
}

import {
  to = module.networking.google_compute_subnetwork.subnet
  id = "projects/${var.project_id}/regions/${var.region}/subnetworks/vpc-subnet-${var.environment}"
}