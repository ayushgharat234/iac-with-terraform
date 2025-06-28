module "networking" {
    source = "./modules/networking"
    project_id = var.project_id
    region = var.region
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