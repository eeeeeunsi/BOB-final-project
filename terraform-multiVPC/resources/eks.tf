module "prd-eks" {
  source = "../module/eks"

  eks_name                = "prd-eks"
  eks_version             = "1.27"
  vpc_id                  = module.prd-vpc.vpc_id
  private_subnets_ids     = [
    module.prd-vpc.private_subnets_ids["subnet_a1"],
    module.prd-vpc.private_subnets_ids["subnet_b1"]
    ]
  endpoint_prviate_access = true
  endpoint_public_access  = true #false -> configure-map 설정 변경 불가
  managed_node_groups = {
    "managed-node-group-a" = {
      node_group_name = "prd-node-group",
      instance_types  = ["t3.medium"],
      capacity_type   = "ON_DEMAND",
      release_version = "" #latest
      disk_size       = 10
      desired_size    = 2,
      max_size        = 3,
      min_size        = 2
    }
  }
  aws_auth_admin_roles = ["arn:aws:iam::560971842042:role/eks-admin-role"]
}

module "common-eks" {
  source = "../module/eks"

  eks_name                = "common-eks"
  eks_version             = "1.27"
  vpc_id                  = module.common-vpc.vpc_id
  private_subnets_ids     = [
    module.common-vpc.private_subnets_ids["subnet_a1"],
    module.common-vpc.private_subnets_ids["subnet_b1"]]
  endpoint_prviate_access = true
  endpoint_public_access  = true #false -> configure-map 설정 변경 불가
  managed_node_groups = {
    "managed-node-group-a" = {
      node_group_name = "common-node-group",
      instance_types  = ["t3.medium"],
      capacity_type   = "ON_DEMAND",
      release_version = "" #latest
      disk_size       = 10
      desired_size    = 2,
      max_size        = 3,
      min_size        = 2
    }
  }
  aws_auth_admin_roles = ["arn:aws:iam::560971842042:role/eks-admin-role"]
}