resource "google_compute_instance" "private-vm" {
  name         = "private-vm"
  machine_type = "f1-micro"
  zone         = "${var.region}-a"
  tags         = ["ssh"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    network    = google_compute_network.main.id
    subnetwork = google_compute_subnetwork.management.id


  }

}
