
# Google Cloud Platform Provider
# https://registry.terraform.io/providers/hashicorp/google/latest/docs
provider "google" {
  credentials = file("amal-348512-856900a6cbba.json")
  project     = var.project
  region      = var.region
  zone        = "${var.region}-a"
}

