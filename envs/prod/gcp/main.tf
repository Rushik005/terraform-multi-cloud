terraform {
  required_version = ">= 1.5.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

# -----------------------------
# Network (Prod)
# -----------------------------
module "network" {
  source      = "../../../modules/gcp-network"
  name        = "prod-vpc"
  project_id  = var.project_id
  region      = var.region
  subnet_cidr = "10.30.0.0/24"
  labels      = var.common_labels
}

# -----------------------------
# Managed Instance Group (Auto Scaling)
# -----------------------------
module "mig" {
  source           = "../../../modules/gcp-mig"
  name             = "prod-app"
  project_id       = var.project_id
  region           = var.region
  zone             = var.zone
  machine_type     = var.machine_type
  subnet_self_link = module.network.subnet_self_link

  # Production scale
  min_replicas = 3
  max_replicas = 10

  labels = var.common_labels
}
}

# -----------------------------
# HTTP Load Balancer
# -----------------------------
module "lb" {
  source             = "../../../modules/gcp-lb"
  name               = "prod-lb"
  project_id         = var.project_id
  backend_service_id = module.mig.instance_group
}
