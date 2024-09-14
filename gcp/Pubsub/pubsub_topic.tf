resource "google_pubsub_topic" "topic" {
  name        = var.topic_name
  project     = var.project_id
  region      = var.region
  message_storage_policy {
    retention_time = "3600s" # Optional: Set message retention time
  }
}