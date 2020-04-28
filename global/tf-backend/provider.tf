provider "aws" {
  allowed_account_ids = ["${var.aws_account_id}"]
  profile             = var.aws_profile
  region              = var.region
}

data "aws_caller_identity" "current" {}
