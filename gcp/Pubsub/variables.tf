variable "project_id" {
  type        = string
  description = "project id"
  default     = ""
}

variable "subscription_name" {
  type        = string
  description = "subscription_name"
  default     = "test"
}

variable "region" {
  type        = string
  description = "gcp region"
  default     = "us-central1"
}

variable "topic_name" {
  type        = string
  description = "topic name"
  default     = "test"
}