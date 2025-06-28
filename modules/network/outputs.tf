output "network_id" {
    value = google_compute_network.vpc_network.id
}

output "subnet_self_link" {
    value = google_compute_subnetwork.vpc_subnet.self_link
}