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
# Network
# -----------------------------
module "network" {
  source      = "../../../modules/gcp-network"
  name        = "dev-vpc"
  project_id  = var.project_id
  region      = var.region
  subnet_cidr = "10.10.0.0/24"
  labels      = var.common_labels
}

# -----------------------------
# Managed Instance Group (Auto Scaling)
# -----------------------------
module "mig" {
  source           = "../../../modules/gcp-mig"
  name             = "dev-app"
  project_id       = var.project_id
  region           = var.region
  zone             = var.zone
  machine_type     = var.machine_type
  subnet_self_link = module.network.subnet_self_link

  min_replicas = 1
  max_replicas = 2

  labels = var.common_labels
}

# -----------------------------
# HTTP Load Balancer
# -----------------------------
module "lb" {
  source             = "../../../modules/gcp-lb"
  name               = "dev-lb"
  project_id         = var.project_id
  backend_service_id = module.mig.instance_group
}
