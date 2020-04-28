terraform {
  backend "s3" {
    acl            = "private"
    bucket         = "scsc-terraform-state"
    key            = "scsc/ec2/terrafom.tfstate"
    profile        = "default"
    region         = "ap-southeast-1"
    dynamodb_table = "scsc-tf-state-lock"
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

