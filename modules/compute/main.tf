resource "google_compute_instance" "vm_instance" {
    name = var.instance_name
    machine_type = "e2-medium"
    zone = var.zone

    boot_disk {
      initialize_params {
        image = "debian-cloud/debian-12"
      }
    }

    network_interface {
      network = "default"
      access_config {}
    }
}