output "gke_cluster_name" {
  description = "cluster name"
  value       = google_container_cluster.gke_cluster.name
}

output "gke_cluster_endpoint" {
  description = "cluster external endpoint"
  value       = google_container_cluster.gke_cluster.endpoint
}

output "gke_cluster_location" {
  description = "cluster location"
  value       = google_container_cluster.gke_cluster.location
}