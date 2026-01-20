project_id   = "my-dev-gcp-project"
region       = "us-central1"
zone         = "us-central1-a"
machine_type = "e2-micro"

common_labels = {
  environment = "dev"
  cost_center = "engineering"
  managed_by  = "terraform"
}
