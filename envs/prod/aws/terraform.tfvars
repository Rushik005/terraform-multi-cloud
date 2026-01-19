region             = "us-east-1"
availability_zone  = "us-east-1c"
ami_id             = "ami-0prodabcdef12345"
instance_type      = "t3.medium"

common_tags = {
  Environment = "prod"
  CostCenter  = "production"
  ManagedBy   = "terraform"
}
