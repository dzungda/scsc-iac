terraform {
  backend "s3" {
    acl            = "private"
    bucket         = "scsc-terraform-state"
    key            = "scsc/ec2/terraform.tfstate"
    region         = "ap-southeast-1"
    profile        = "default"
    dynamodb_table = "scsc-tf-state-lock"
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket  = "scsc-terraform-state"
    key     = "scsc-stg/vpc/terraform.tfstate"
    region  = "ap-southeast-1"
    profile = "default"
  }
}

data "terraform_remote_state" "ec2" {
  backend = "s3"

  config = {
    bucket  = "scsc-terraform-state"
    key     = "scsc/ec2/terrafom.tfstate"
    region  = "ap-southeast-1"
    profile = "default"
  }
}

data "terraform_remote_state" "sg" {
  backend = "s3"

  config = {
    bucket  = "scsc-terraform-state"
    key     = "scsc/sg/terraform.tfstate"
    region  = "ap-southeast-1"
    profile = "default"
  }
}
