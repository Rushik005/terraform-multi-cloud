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
  name        = "stage-vpc"
  project_id  = var.project_id
  region      = var.region
  subnet_cidr = "10.20.0.0/24"
}

# -----------------------------
# Compute
# -----------------------------
module "gce" {
  source           = "../../../modules/gcp-gce"
  name             = "stage-vm"
  project_id       = var.project_id
  zone             = var.zone
  machine_type     = var.machine_type
  subnet_self_link = module.network.subnet_self_link

  labels = {
    environment = "stage"
    managed_by  = "terraform"
    cost_center = "preprod"
  }
}
