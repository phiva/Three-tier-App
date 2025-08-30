terraform {
  backend "s3" {
    bucket = "s3-backend-exemple"
    key    = "three-tier-app/terraform.tfstate"
    region = "us-east-1"
    assume_role = {
      role_arn = "arn:aws:iam::123456789012:role/TerraformAssumeRole"
    }
  }
}