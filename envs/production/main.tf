terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-2"
  profile = "sso-test"
}

module "vpc" {
  source = "../../modules/vpc"
  
  environment = "production"
  vpc_cidr = "10.0.0.0/16"
  nat_gateway_azs = ["ap-northeast-2a",]
  
}