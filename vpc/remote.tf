terraform {
  backend "s3" {
    acl            = "private"
    bucket         = "scsc-terraform-state"
    key            = "scsc-stg/vpc/terraform.tfstate"
    profile        = "default"
    region         = "ap-southeast-1"
    dynamodb_table = "scsc-tf-state-lock"
  }
}
