resource "google_compute_instance" "vm_instance" {
    count = var.instance_count
    name = "${var.name_prefix}-vm-${count.index}"
    machine_type = var.machine_type
    zone = var.zone

    boot_disk {
      initialize_params {
        image = var.boot_image
      }
    }

    network_interface {
      subnetwork = var.subnet_self_link
      access_config {}
    }

    metadata = {
        startup-script = var.startup_script
    }

    tags = var.tags
}

