terraform {
  backend "s3" {
    bucket         = "tf-state-prod"
    key            = "aws/prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
