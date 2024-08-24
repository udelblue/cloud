variable "region" {
  type        = string
  description = "gcp region"
  default     = "us-central1"
}

variable "zone" {
  type        = string
  description = "gcp zone - note leave empty if you want a regional cluster"
  default     = "us-central1-b"
}

variable "gke_cluster_name" {
  type        = string
  description = "gke_cluster name"
  default     = "my-gke-cluster"
}

variable "gke_cluster_node_type" {
  type        = string
  description = "gke_cluster node type"
  default     = "n1-standard-1"
}

variable "gke_cluster_node_init_count" {
  type        = number
  description = "gke_cluster node initial count"
  default     = 1
}

variable "environment_default_label" {
  type        = string
  description = "environment default label"
  default     = "dev"
}

