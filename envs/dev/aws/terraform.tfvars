region            = "us-east-1"
availability_zone = "us-east-1a"
ami_id            = "ami-0devabcdef12345"
instance_type     = "t3.micro"

common_tags = {
  Environment = "dev"
  CostCenter  = "engineering"
  ManagedBy   = "terraform"
}
