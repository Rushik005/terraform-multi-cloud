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
# Compute (Prod)
# -----------------------------
module "ec2" {
  source        = "../../../modules/aws-ec2"
  name          = "prod-ec2"
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = module.network.vpc_id

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
    CostCenter  = "production"
    Criticality = "high"
  }
}
