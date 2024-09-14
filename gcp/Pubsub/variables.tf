variable "project" {
  type        = string
  description = "project id"
  default     = ""
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