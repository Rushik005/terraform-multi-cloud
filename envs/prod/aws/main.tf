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
# Network (Prod)
# -----------------------------
module "network" {
  source       = "../../../modules/aws-network"
  name         = "prod-vpc"
  vpc_cidr     = "10.20.0.0/16"
  subnet_cidr  = "10.20.1.0/24"
  az           = var.availability_zone
}

# -----------------------------
# Compute wiht ALB + ASG (Prod)
# -----------------------------
module "alb" {
  source     = "../../../modules/aws-alb"
  name       = "prod-alb"
  vpc_id     = module.network.vpc_id
  subnet_ids = module.network.subnet_ids
  tags       = var.common_tags
}

module "asg" {
  source             = "../../../modules/aws-asg"
  name               = "prod-asg"
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  subnet_ids         = module.network.subnet_ids
  target_group_arn  = module.alb.target_group_arn
  min_size           = 2
  max_size           = 6
  desired_capacity   = 3
  security_group_ids = [module.network.app_sg_id]
  tags               = var.common_tags
}

