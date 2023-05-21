resource "google_compute_network" "my_network" {
  name                    = "first-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "my_subnetwork" {
  name          = "first-subnetwork"
  ip_cidr_range = var.ip_subnet
  network       = google_compute_network.my_network.name
}

resource "google_compute_router" "router" {
  name    = "nat-router"
  network = google_compute_network.my_network.id
}

resource "google_compute_address" "address" {
  count  = 2
  name   = "nat-manual-ip-${count.index}"
}

resource "google_compute_router_nat" "nat" {
  name    = "my-router-nat"
  router = google_compute_router.router.name
  nat_ip_allocate_option = "MANUAL_ONLY"
  nat_ips = google_compute_address.address.*.self_link
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork {
    name                    = google_compute_subnetwork.my_subnetwork.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}

