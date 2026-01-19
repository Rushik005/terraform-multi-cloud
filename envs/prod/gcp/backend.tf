terraform {
  backend "gcs" {
    bucket  = "tf-state-prod"
    prefix  = "gcp/prod"
  }
}
