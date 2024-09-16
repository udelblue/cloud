
# Configure the Google Cloud Platform provider
provider "google" {
  credentials = file("/home/cdsommers/gcp_key.json")
  region      = var.region
}

#store state in cloud storeage
terraform {
  backend "gcs" {
    bucket = "showcase-terraform-remote-backend"
  }
}

resource "google_pubsub_subscription" "demo_sub" {
  name  = var.subscription_name
  topic = google_pubsub_topic.topic.name
}
resource "google_pubsub_topic" "topic" {
  name                       = var.topic_name
  project                    = var.project_id
  message_retention_duration = "3600s"

}


