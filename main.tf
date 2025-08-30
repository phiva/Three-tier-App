provider "aws" {
  region = var.region

  assume_role {
    role_arn     = "arn:aws:iam::12345678903:role/TerraformAssumeRole"
    session_name = "terraform-session"
  }
}

module "vpc" {
  source = "./modules/vpc"

  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  azs                  = var.azs
}

module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
}


module "alb" {
  source            = "./modules/alb"
  vpc_id = module.vpc.vpc_id
  sg_alb_id         = module.sg.alb_sg_id
  public_subnet_ids = module.vpc.public_subnet_ids
  certificate_arn  = "arn:aws:acm:us-east-1:123456789012:certificate/abcdefg-1234-5678-9101-abcdefg"
}

module "route53_simple" {
  source       = "./modules/route53"
  domain_name  = "example.com"
  record_name  = ["www.example.com", "api.example.com"]
  record_value = ["192.0.2.10", "192.0.2.20"]
  record_type  = "A"
  ttl          = 300
  common_tags  = { project = "myproject", owner = "team" }
}


module "cloudfront_s3" {
  source      = "./modules/cloudfront"
  bucket_name = "xxxxxxxxxxxx-23455655-wwwwwwwwwwwww"
  aws_region  = "us-east-1"
}

