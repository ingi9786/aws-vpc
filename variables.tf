variable "vpc_cidr" {
  default = "10.0.0.0/16"
  description = "CIDR block for the VPC"
}

variable "azs" {
  default = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c", "ap-northeast-2d"]
  description = "List of availability zones"
}

variable "subnet_cidrs" {
  default = {
    public  = ["10.0.0.0/20", "10.0.32.0/20", "10.0.64.0/20", "10.0.96.0/20"]
    private = ["10.0.16.0/20", "10.0.48.0/20", "10.0.80.0/20", "10.0.112.0/20"]
  }
  description = "CIDR blocks for public and private subnets"
}

variable "nat_gateway_azs" {
  default = ["ap-northeast-2a"]
  description = "List of availability zones for nat gateways"
}

