resource "google_compute_network" "vpc" {
  name                    = var.name
  project                 = var.project_id
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = "${var.name}-subnet"
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  project       = var.project_id
  network       = google_compute_network.vpc.id
}
