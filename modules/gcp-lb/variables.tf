variable "name" {
  description = "Base name for load balancer resources"
  type        = string
}

variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "backend_service_id" {
  description = "Backend service ID from MIG"
  type        = string
}
