project_id   = "my-prod-gcp-project"
region       = "us-central1"
zone         = "us-central1-c"
machine_type = "e2-standard-4"

common_labels = {
  environment = "prod"
  cost_center = "production"
  managed_by  = "terraform"
}
