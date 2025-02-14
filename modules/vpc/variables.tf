variable "environment" {
  description = "Environment (dev/prod)"
  type        = string
}

variable "name_prefix" {
  description = "Prefix for Name"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "azs" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c", "ap-northeast-2d"]
}

variable "subnet_cidrs" {
  description = "CIDR blocks for public and private subnets"
  type        = map(list(string))
  default     = {
    public  = ["10.0.0.0/20", "10.0.32.0/20", "10.0.64.0/20", "10.0.96.0/20"]
    private = ["10.0.16.0/20", "10.0.48.0/20", "10.0.80.0/20", "10.0.112.0/20"]
  }
}

variable "nat_gateway_azs" {
  description = "List of availability zones for nat gateways"
  type        = list(string)
}