project_id   = "my-stage-gcp-project"
region       = "us-central1"
zone         = "us-central1-b"
machine_type = "e2-standard-2"

common_labels = {
  environment = "stage"
  cost_center = "preprod"
  managed_by  = "terraform"
}
