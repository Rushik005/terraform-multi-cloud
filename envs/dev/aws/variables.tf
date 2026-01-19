variable "region" {
  description = "AWS region"
  type        = string
}

variable "availability_zone" {
  description = "AWS availability zone"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for dev"
  type        = string
}

variable "instance_type" {
  description = "Instance type for dev ASG"
  type        = string
}

variable "common_tags" {
  description = "Mandatory cost-allocation tags"
  type        = map(string)

  validation {
    condition = alltrue([
      contains(keys(var.common_tags), "Environment"),
      contains(keys(var.common_tags), "CostCenter"),
      contains(keys(var.common_tags), "ManagedBy")
    ])
    error_message = "common_tags must include Environment, CostCenter, and ManagedBy"
  }
}
