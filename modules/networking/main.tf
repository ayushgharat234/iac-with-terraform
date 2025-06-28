resource "google_compute_network" "vpc" {
  name                    = "vpc-${var.environment}"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name = "vpc-subnet-${var.environment}"
  ip_cidr_range = "10.10.0.0/24"
  region = var.region
  network = google_compute_network.vpc.id

}