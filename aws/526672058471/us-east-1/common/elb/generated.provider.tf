# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
    terraform {
      backend "s3" {}
      required_version = ">= 0.56.0"
    }

    provider "aws" {
      region  = "us-east-1"
      default_tags {
        tags = {"environment":"common"}
      }
    }
