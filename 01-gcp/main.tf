terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.64"
    }
  }
}

provider "google" {
  project = "managment-382811"
  region  = "europe-central2"
  zone    = "europe-central2-b"
}

resource "google_compute_network" "my_network" {
  name                    = "first-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "my_subnetwork" {
  name          = "first-subnetwork"
  ip_cidr_range = var.ip_subnet
  network       = google_compute_network.my_network.name
  region        = "europe-central2"
}

resource "google_compute_vpn_gateway" "my_gateway" {
  name    = "first-gateway"
  network = google_compute_network.my_network.name
}

resource "google_compute_router" "my_router" {
  name    = "network-router"
  network = google_compute_network.my_network.name
}



resource "google_compute_firewall" "apache2" {
  name    = "apache2-firewall"
  network = google_compute_network.my_network.name
#  allow {
#    protocol = var.allows["protocol"]
#    ports    = var.allows["ports"]
#  }
  dynamic "allow" {
    for_each = var.ports
    content {
      protocol = var.allows.protocol
      ports = allow.value[*]
    }
  }

  direction = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
}




resource "google_compute_instance" "my_instance" {
  name         = "instance-${count.index}"
  machine_type = var.my_instance[0]
  zone         = "europe-central2-b"

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }
  metadata_startup_script = "sudo yum update -y && sudo yum install httpd -y && sudo systemctl start httpd"

  network_interface {
    subnetwork = google_compute_subnetwork.my_subnetwork.name
    access_config {
    }
  }
  count = var.istest == true ? 1:0
}


