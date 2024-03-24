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

module "docker" {
  source = "./docker"

  aws_ecr_repository = module.ecr.aws_ecr_repository
  aws_region         = "us-west-1"
}

module "ecs" {
  source = "./ecs"

  subnets            = module.vpc.public_subnet_ids
  aws_ecr_repository = module.ecr.aws_ecr_repository
  execution_role     = module.iam.ecs_role_arn
}

module "iam" {
  source = "./iam"

  ecs_arn = module.ecs.ecs_task_arn
}