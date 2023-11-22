module "BoB-TGW" {
  source = "../module/tgw"

  vpc_attachments = [
    {
      vpc_id     = module.prd-vpc.vpc_id
      subnet_ids = [module.prd-vpc.private_subnets_ids["subnet_a1"],
                    module.prd-vpc.private_subnets_ids["subnet_b1"]]
    },
    {
      vpc_id     = module.common-vpc.vpc_id
      subnet_ids = [module.common-vpc.private_subnets_ids["subnet_a1"], 
                    module.common-vpc.private_subnets_ids["subnet_b1"]]
    },
    {
      vpc_id     = module.mgmt-vpc.vpc_id
      subnet_ids = [module.mgmt-vpc.private_subnets_ids["subnet_a1"], 
                    module.mgmt-vpc.private_subnets_ids["subnet_b1"]]
    }
  ]
}
