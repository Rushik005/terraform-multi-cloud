terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# -----------------------------
# Network
# -----------------------------
module "network" {
  source       = "../../../modules/aws-network"
  name         = "dev-vpc"
  vpc_cidr     = "10.0.0.0/16"
  subnet_cidr  = "10.0.1.0/24"
  az           = var.availability_zone
  tags         = var.common_tags
}

# -----------------------------
# Application Load Balancer
# -----------------------------
module "alb" {
  source     = "../../../modules/aws-alb"
  name       = "dev-alb"
  vpc_id     = module.network.vpc_id
  subnet_ids = module.network.subnet_ids
  tags       = var.common_tags
}

# -----------------------------
# Auto Scaling Group
# -----------------------------
module "asg" {
  source              = "../../../modules/aws-asg"
  name                = "dev-asg"
  ami_id              = var.ami_id
  instance_type       = var.instance_type
  subnet_ids          = module.network.subnet_ids
  target_group_arn    = module.alb.target_group_arn
  security_group_ids  = [module.network.app_sg_id]

  min_size         = 1
  max_size         = 2
  desired_capacity = 1

  tags = var.common_tags
}
