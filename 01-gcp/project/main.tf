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

module "my_vps" {
  source = "../modules/vpc"
}

module "my_instance" {
  source           = "../modules/instances"
#   instance_type    = var.instance_type
#   number_instances = var.number_instances
#   instance_image   = var.instance_image
  subnetwork_id = module.my_vps.subnetwork_id
}

module "firewall" {
  source = "../modules/firewall"
  network_id = module.my_vps.network_id
}
