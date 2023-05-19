terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.64"
    }
  }
}

resource "google_compute_network" "my_network" {
  name                    = "first-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "my_subnetwork" {
  name          = "first-subnetwork"
  ip_cidr_range = var.ip_subnet
  network       = google_compute_network.my_network.name
}

resource "google_compute_vpn_gateway" "my_gateway" {
  name    = "first-gateway"
  network = google_compute_network.my_network.name
}



