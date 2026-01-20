variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "zone" {
  description = "GCP zone"
  type        = string
}

variable "machine_type" {
  description = "GCE machine type"
  type        = string
}

variable "common_labels" {
  description = "Mandatory cost-allocation and ownership labels"
  type        = map(string)

  validation {
    condition = alltrue([
      contains(keys(var.common_labels), "environment"),
      contains(keys(var.common_labels), "cost_center"),
      contains(keys(var.common_labels), "managed_by")
    ])
    error_message = "common_labels must include environment, cost_center, and managed_by"
  }
}
