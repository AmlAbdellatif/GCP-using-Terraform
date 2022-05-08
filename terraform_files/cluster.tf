# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster
resource "google_container_cluster" "my-cluster" {
  name                     = "my-cluster"
  location                 = "${var.region}-a" #location of master node and nodes
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = google_compute_network.main.id
  subnetwork               = google_compute_subnetwork.restricted.id


  ip_allocation_policy {

  }

  private_cluster_config {
    enable_private_nodes    = true #make it a private cluster , will one use private ips from private subnet for k8s nodes
    enable_private_endpoint = true #allow basition host to connect to your cluster 
    master_ipv4_cidr_block  = "192.168.1.0/28"
  }

  #   Jenkins use case
  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = "10.0.0.0/24"
      display_name = "public-subnet"
    }
  }
}