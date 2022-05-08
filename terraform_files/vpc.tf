# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network
resource "google_compute_network" "main" {
  name                    = "main"
  project                 = var.project
  auto_create_subnetworks = false
  mtu                     = 1500
}

resource "google_compute_subnetwork" "management" {
  name          = "management"
  ip_cidr_range = "10.0.0.0/24"
  region        = var.region
  network       = google_compute_network.main.id
}

# Private Subnet
# https://www.terraform.io/docs/providers/google/r/compute_subnetwork.html
resource "google_compute_subnetwork" "restricted" {
  name          = "restricted"
  ip_cidr_range = "10.0.1.0/24"
  region        = var.region
  network       = google_compute_network.main.id

}

# Cloud Router
# https://www.terraform.io/docs/providers/google/r/compute_router.html
resource "google_compute_router" "router" {
  name    = "router"
  network = google_compute_network.main.id

}

# NAT Gateway
# https://www.terraform.io/docs/providers/google/r/compute_router_nat.html


# NAT FOR MANAGMENT SUBNET
resource "google_compute_router_nat" "nat-management" {
  name                               = "nat-management"
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name                    = "management"
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}

    