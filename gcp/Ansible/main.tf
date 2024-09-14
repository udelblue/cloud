
# Configure the Google Cloud Platform provider
provider "google" {
  credentials = file("/home/cdsommers/gcp_key.json")
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


# Create a Cloud Storage bucket for storing Ansible modules
resource "google_storage_bucket" "ansible_modules" {
  name          = "ansible-modules-bucket"
  location      = "US"
  uniform_bucket_level_access = true
}

# Create a Compute Engine instance to run Ansible
resource "google_compute_instance" "ansible_instance" {
  name         = "ansible-instance"
  machine_type = "n1-standard-1" # Adjust based on your needs
  zone         = "us-central1-a" # Replace with your desired zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11-buster-generic"
    }
  }

  network_interface {
    network = "default"
    access_config {
      # Allow SSH access
      nat = "EXTERNAL"
    }
  }

  metadata = {
    "startup-script" = <<-EOF
      #!/bin/bash

      # Install Ansible and required packages
      apt-get update -y
      apt-get install -y ansible python3-pip

      # Install Terraform
      pip3 install terraform

      # Clone your Ansible Terraform modules repository
      git clone https://github.com/your-username/your-ansible-modules-repo /ansible-modules

      # Configure Terraform provider and credentials
      terraform init
      terraform configure -backend=remote {
        organization = "your-organization" # Replace with your organization
        workspace    = "your-workspace"   # Replace with your workspace
      }
    EOF
  }
}
