terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.64"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}


resource "google_compute_autoscaler" "my_autoscaler" {
  name   = "my-autoscaler"
  zone   = var.zone
  target = google_compute_instance_group_manager.my_group.id

  autoscaling_policy {
    max_replicas    = 5
    min_replicas    = 1
    cooldown_period = 60
  }
}

resource "google_compute_instance_template" "my_template" {
  name           = "my-instance-template"
  machine_type   = "e2-micro"
  can_ip_forward = false

  tags = ["foo", "bar"]

  disk {
    source_image = data.google_compute_image.debian_9.id
  }

  network_interface {
    network = "default"
  }

  metadata = {
    foo = "bar"
  }

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}

resource "google_compute_target_pool" "default" {
  name = "my-target-pool"
}

resource "google_compute_instance_group_manager" "my_group" {
  name = "my-igm"
  zone = var.zone

  version {
    instance_template = google_compute_instance_template.my_template.id
    name              = "primary"
  }

  target_pools       = [google_compute_target_pool.default.id]
  base_instance_name = "autoscaler-sample"
}

data "google_compute_image" "debian_9" {
  family  = "debian-11"
  project = "debian-cloud"
}
