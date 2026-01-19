module "network" {
  source      = "../../../modules/gcp-network"
  name        = "dev-vpc"
  project_id  = var.project_id
  region      = var.region
  subnet_cidr = "10.10.0.0/24"
}

module "vm" {
  source            = "../../../modules/gcp-gce"
  name              = "dev-vm"
  project_id        = var.project_id
  zone              = "us-central1-a"
  machine_type      = "e2-medium"
  subnet_self_link  = module.network.subnet_self_link
  tags              = ["dev"]
  labels = {
    environment = "dev"
    managed_by  = "terraform"
  }
}
