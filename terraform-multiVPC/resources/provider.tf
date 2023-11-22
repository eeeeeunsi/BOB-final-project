terraform {
  required_version = "> 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.3.0"
    }
  }
  backend "s3" {
    bucket = "bob-tf-state-bucket"
    key    = "network/terraform.tfstate"
    region = "ap-northeast-2"
  }
}

provider "aws" {
  region                   = "ap-northeast-2"
  shared_credentials_files = ["C:/Users/admin/.aws/credentials"]
  profile                  = "tf-user"
}