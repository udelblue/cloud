
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

module "pubsub_topic" {
  source = "terraform-google-modules/pubsub"

  project_id = var.project_id
  name       =  var.topic_name
  region     = var.region 
}

