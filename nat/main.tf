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



module "my_vps" {
  source = "./modules/vpc"
}

module "my_instance" {
  source        = "./modules/instances"
  network_id = module.my_vps.network_id
  subnetwork_id = module.my_vps.subnetwork_id
}

module "firewall" {
  source     = "./modules/firewall"
  network_id = module.my_vps.network_id
}
