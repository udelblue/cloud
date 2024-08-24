
# Configure the Google Cloud Platform provider
provider "google" {
  credentials = file("/home/cdsommers/key.json")
  region      = var.region
  default_labels = {
    environment = var.environment_default_label
  }
}

#store state in cloud storeage
terraform {
  backend "gcs" {
    bucket = "showcase-terraform-remote-backend"
  }
}

#check if zone is empty string - regional or zonal cluster
locals {
  gke_location = var.zone == "" ? var.region : var.zone
}


resource "google_container_cluster" "gke_cluster" {
  name     = var.gke_cluster_name
  location = var.zone

  initial_node_count = var.gke_cluster_node_init_count

  node_config {
    machine_type = var.gke_cluster_node_type
  }
  # Update deletion_protection to false
  deletion_protection = false



}