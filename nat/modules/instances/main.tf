resource "google_compute_instance" "my_instance" {
  name         = "instance-${count.index}"
  machine_type = var.instance_type

  boot_disk {
    initialize_params {
      image = var.instance_image
    }
  }

  metadata_startup_script = file("modules/instances/startup.sh")

  network_interface {
    network = var.network_id
    subnetwork = var.subnetwork_id
  }
  count = var.instance_number
}

