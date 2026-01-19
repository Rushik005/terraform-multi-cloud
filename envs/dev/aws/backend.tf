terraform {
  backend "s3" {
    bucket         = "tf-state-dev"
    key            = "aws/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
