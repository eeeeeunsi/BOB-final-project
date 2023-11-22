variable "vpc_cidr" {
  description = "The CIDR block of this VPC"
  type        = string
}

variable "public_subnets" {
  description = "The Public Subnets of this VPC"
  type = map(object({
    cidr = string
    az   = string
    tags = map(string)
  }))
}

variable "private_subnets" {
  description = "The Private Subnets of this VPC"
  type = map(object({
    cidr = string
    az   = string
    tags = map(string)
  }))
}