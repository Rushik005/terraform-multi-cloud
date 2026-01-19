region             = "us-east-1"
availability_zone  = "us-east-1b"
ami_id             = "ami-0stageabcdef12345"
instance_type      = "t3.small"

common_tags = {
  Environment = "stage"
  CostCenter  = "stage"
  ManagedBy   = "terraform"
}
