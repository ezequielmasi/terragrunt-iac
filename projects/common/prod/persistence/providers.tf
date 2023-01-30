terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket  = "nimbus-terraform-tfstate"
    key     = "common/prod/persistence/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
    profile = "nimbus"
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "nimbus"
}