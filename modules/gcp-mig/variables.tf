variable "name" {
  description = "Base name for MIG resources"
  type        = string
}

variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "Region for MIG"
  type        = string
}

variable "zone" {
  description = "Zone for instance template"
  type        = string
}

variable "machine_type" {
  description = "Machine type"
  type        = string
}

variable "subnet_self_link" {
  description = "Subnetwork self link"
  type        = string
}

variable "min_replicas" {
  type = number
}

variable "max_replicas" {
  type = number
}

variable "labels" {
  description = "Mandatory cost and ownership labels"
  type        = map(string)
}
