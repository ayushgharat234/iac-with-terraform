resource "google_compute_netowrk" "vpc_network" {
  name = var.network_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "vpc_subnet" {
  name = "${var.network_name}-subnet"
  ip_cidr_range = var.cidr_block
  region = var.region
  network = google_compute_netowrk.vpc_network.id
}
