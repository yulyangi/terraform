terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.64"
    }
  }
}

resource "google_compute_instance" "my_instance" {
  name         = "instance-${count.index}"
  machine_type = var.instance_type

  boot_disk {
    initialize_params {
      image = var.instance_image
    }
  }

  network_interface {
    subnetwork = var.subnetwork_id
    access_config {
    }
  }
  count = var.number_instances
}

