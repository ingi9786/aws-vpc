terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "local" {
    path = "terraform.tfstate"
  }
}

provider "aws" {
  region = "ap-northeast-2"
  profile = "sso-test"
}


# # Include all configuration files
# module "vpc" {
#   source = "./vpc.tf"
# }

# module "subnets" {
#   source = "./subnets.tf"
# }

# module "vpc-endpoints" {
#   source = "./endpoints.tf"
# }

# module "routes" {
#   source = "./routes.tf"
# }

