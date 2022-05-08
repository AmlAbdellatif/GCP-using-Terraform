resource "google_compute_firewall" "ssh-firewall" {
  name    = "ssh-firewall"
  network = google_compute_network.main.id
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["35.235.240.0/20"] # allow only google ip to access
  target_tags   = ["ssh"]
}