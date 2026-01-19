module "network" {
  source      = "../../../modules/gcp-network"
  name        = "dev-vpc"
  project_id  = var.project_id
  region      = var.region
  subnet_cidr = "10.10.0.0/24"
}
