terraform {
  backend "gcs" {
    bucket  = "tf-state-stage"
    prefix  = "gcp/stage"
  }
}
