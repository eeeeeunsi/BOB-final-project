################################################################################
# PRD-VPC
################################################################################
module "prd-vpc" {
  source      = "../module/vpc"
  module_name = "PRD-vpc"

  vpc_cidr = "10.10.0.0/16"
  public_subnets = {
    "subnet_a1" = {
      cidr = "10.10.99.0/24",
      az   = "ap-northeast-2a",
      tags = {
        Name        = "PRD-pub-sbnt-2a"
        Environment = "Terraform"
        Project     = "BoB-Final"
      }
    }
  }
  private_subnets = {
    "subnet_a1" = {
      cidr = "10.10.2.0/24",
      az   = "ap-northeast-2a",
      tags = {
        Name                              = "PRD-pri1-sbnt-2a"
        Environment                       = "Terraform"
        Project                           = "BoB-Final"
      }
    },
    "subnet_a2" = {
      cidr = "10.10.3.0/24",
      az   = "ap-northeast-2a",
      tags = {
        Name        = "PRD-pri2-sbnt-2a"
        Environment = "Terraform"
        Project     = "BoB-Final"
      }
    },
    "subnet_b1" = {
      cidr = "10.10.12.0/24",
      az   = "ap-northeast-2c",
      tags = {
        Name                              = "PRD-pri1-sbnt-2c"
        Environment                       = "Terraform"
        Project                           = "BoB-Final"
        "kubernetes.io/cluster/prd-eks"   = "shared"
        "kubernetes.io/role/internal-elb" = 1
      }
    },
    "subnet_b2" = {
      cidr = "10.10.13.0/24",
      az   = "ap-northeast-2c",
      tags = {
        Name        = "PRD-pri2-sbnt-2c"
        Environment = "Terraform"
        Project     = "BoB-Final"
      }
    }
  }
}

################################################################################
# COMMON-VPC
################################################################################
module "common-vpc" {
  source      = "../module/vpc"
  module_name = "COMMON-vpc"

  vpc_cidr = "10.20.0.0/16"
  public_subnets = {
    "subnet_a1" = {
      cidr = "10.20.99.0/24",
      az   = "ap-northeast-2a",
      tags = {
        Name        = "COMMON-pub-sbnt-2a"
        Environment = "Terraform"
        Project     = "BoB-Final"
      }
    }
  }
  private_subnets = {
    "subnet_a1" = {
      cidr = "10.20.2.0/24",
      az   = "ap-northeast-2a",
      tags = {
        Name                               = "COMMON-pri1-sbnt-2a"
        Environment                        = "Terraform"
        Project                            = "BoB-Final"
        "kubernetes.io/cluster/common-eks" = "shared"
        "kubernetes.io/role/internal-elb"  = 1
      }
    }
    "subnet_b1" = {
      cidr = "10.20.12.0/24",
      az   = "ap-northeast-2c",
      tags = {
        Name                               = "COMMON-pri1-sbnt-2c"
        Environment                        = "Terraform"
        Project                            = "BoB-Final"
        "kubernetes.io/cluster/common-eks" = "shared"
        "kubernetes.io/role/internal-elb"  = 1
      }
    }
  }
}

################################################################################
# MGMT-VPC
################################################################################
module "mgmt-vpc" {
  source      = "../module/vpc"
  module_name = "MGMT-vpc"

  vpc_cidr = "10.30.0.0/16"
  public_subnets = {
    "subnet_a1" = {
      cidr = "10.30.1.0/24",
      az   = "ap-northeast-2a",
      tags = {
        Name                               = "MGMT-pub-sbnt-2a"
        Environment                        = "Terraform"
        Project                            = "BoB-Final"
        "kubernetes.io/cluster/prd-eks"    = "shared"
        "kubernetes.io/cluster/common-eks" = "shared"
        "kubernetes.io/role/elb"           = 1
      }
    },
    "subnet_b1" = {
      cidr = "10.30.11.0/24",
      az   = "ap-northeast-2c",
      tags = {
        Name                               = "MGMT-pub-sbnt-2c"
        Environment                        = "Terraform"
        Project                            = "BoB-Final"
        "kubernetes.io/cluster/prd-eks"    = "shared"
        "kubernetes.io/cluster/common-eks" = "shared"
        "kubernetes.io/role/elb"           = 1
      }
    }
  }
  private_subnets = {
    "subnet_a1" = {
      cidr = "10.30.2.0/24",
      az   = "ap-northeast-2a",
      tags = {
        Name        = "MGMT-pri-sbnt-2a"
        Environment = "Terraform"
        Project     = "BoB-Final"
      }
    },
    "subnet_b1" = {
      cidr = "10.30.12.0/24",
      az   = "ap-northeast-2c",
      tags = {
        Name        = "MGMT-pri-sbnt-2c"
        Environment = "Terraform"
        Project     = "BoB-Final"
      }
    }
  }
}