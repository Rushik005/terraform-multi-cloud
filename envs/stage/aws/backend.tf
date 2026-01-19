terraform {
  backend "s3" {
    bucket         = "tf-state-stage"
    key            = "aws/stage/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
