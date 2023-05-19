output "subnetwork_id" {
    value = google_compute_subnetwork.my_subnetwork.id
}

output "network_id" {
    value = google_compute_network.my_network.id
}