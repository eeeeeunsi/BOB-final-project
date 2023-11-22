variable "eks_name" {
  description = "The name of EKS Cluster"
  type        = string
}

variable "eks_version" {
  description = "The version of AWS EKS"
  type        = string
}

variable "vpc_id" {
  description = "The ID of VPC"
  type        = string
}

variable "private_subnets_ids" {
  description = "private subnets ids"
  type        = list(string)
}

variable "endpoint_prviate_access" {
  description = "endpoint for prviate access"
  type        = bool
  default     = true
}

variable "endpoint_public_access" {
  description = "endpoint for public for access"
  type        = bool
  default     = true
}

variable "managed_node_groups" {
  type = map(object({
    node_group_name = string
    instance_types  = list(string)
    capacity_type   = string
    release_version = string
    disk_size       = number
    desired_size    = number
    max_size        = number
    min_size        = number
  }))
}

variable "aws_auth_admin_roles" {
  description = "eks admin in aws auth configmap"
  type        = list(string)
  default     = []
}