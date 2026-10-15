terraform {
  backend "s3" {
    bucket = "dbx-s3-bucket-947247293170-us-east-1-an"
    key    = "terraform/ops-dev/terraform.tfstate"
    region = "us-east-1"
  }
}