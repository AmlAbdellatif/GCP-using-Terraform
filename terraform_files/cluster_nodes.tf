# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account
resource "google_service_account" "kube-service" {
  account_id   = "kube-service"
  display_name = "Service Account for K8s"
}
resource "google_project_iam_member" "kube-service-binding" {
  project = "amal-348512"
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.kube-service.email}"
}
resource "google_container_node_pool" "master" {
  name       = "linux-pool-master-tf"
  cluster    = google_container_cluster.my-cluster.name
  location   = google_container_cluster.my-cluster.location
  node_count = 2

  node_config {
    preemptible     = true
    machine_type    = "e2-small"
    service_account = google_service_account.kube-service.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

}
