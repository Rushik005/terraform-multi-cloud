variable "name" {
  description = "Name of the GCE instance"
  type        = string
}

variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "zone" {
  description = "Zone where the GCE instance will be created"
  type        = string
}

variable "machine_type" {
  description = "Machine type for the GCE instance"
  type        = string
}

variable "subnet_self_link" {
  description = "Self link of the subnetwork"
  type        = string
}

variable "tags" {
  description = "Network tags for firewall rules"
  type        = list(string)
  default     = []
}

variable "labels" {
  description = "Labels to apply to the instance"
  type        = map(string)
  default     = {}
}
