terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.64"
    }
  }
}

resource "google_compute_firewall" "apache2" {
  name    = "apache2-firewall"
  network = var.network_id
  allow {
    protocol = var.allows["protocol"]
    ports    = var.allows["ports"]
  }

  direction = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
}