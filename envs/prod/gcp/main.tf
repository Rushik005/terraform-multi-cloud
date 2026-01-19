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
}

# -----------------------------
# Compute (Prod)
# -----------------------------
module "gce" {
  source           = "../../../modules/gcp-gce"
  name             = "prod-vm"
  project_id       = var.project_id
  zone             = var.zone
  machine_type     = var.machine_type
  subnet_self_link = module.network.subnet_self_link

  labels = {
    environment = "prod"
    managed_by  = "terraform"
    cost_center = "production"
    criticality = "high"
  }
}
