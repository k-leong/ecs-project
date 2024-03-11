terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-west-1"
}

module "vpc" {
  source = "./vpc"
}

module "ecr" {
  source = "./ecr"
}

module "ecs" {
  source = "./ecs"

  aws_ecr_repository = module.ecr.aws_ecr_repository
}

module "docker" {
  source = "./docker"

  aws_ecr_repository = module.ecr.aws_ecr_repository
  aws_region         = "us-west-1"
}