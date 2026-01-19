variable "name" {
  description = "Name of the VPC network"
  type        = string
}

variable "region" {
  description = "Region where the subnetwork will be created"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR range for the subnetwork"
  type        = string
}

variable "project_id" {
  description = "GCP project ID"
  type        = string
}
