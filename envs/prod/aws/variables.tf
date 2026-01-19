variable "region" {
  description = "AWS region"
  type        = string
}

variable "availability_zone" {
  description = "AWS availability zone"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "common_tags" {
  description = "Mandatory tags applied to all AWS resources"
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
