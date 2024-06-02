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

module "rt" {
  source = "./rt"

  vpc_id = module.vpc.vpc_id
  subnets = module.vpc.public_subnet_ids
  igw_id = module.vpc.igw_id

  depends_on = [ module.vpc ]
}

module "sg" {
  source = "./sg"

  vpc_id = module.vpc.vpc_id
}

# module "ecr" {
#   source = "./ecr"
# }

module "elb" {
  source = "./elb"

  subnets = module.vpc.public_subnet_ids
  vpc = module.vpc.vpc_id
  sg = module.sg.alb_sg
}

# module "docker" {
#   source = "./docker"

#   aws_ecr_repository = module.ecr.aws_ecr_repository
#   aws_region         = "us-west-1"
# }

module "ecs" {
  source = "./ecs"

  subnets            = module.vpc.public_subnet_ids
  # aws_ecr_repository = module.ecr.aws_ecr_repository
  execution_role     = module.iam.ecs_role_arn
  container_image = var.ecs_container_image
  sg = module.sg.sg
  alb_target_group = module.elb.elb_target_group_arn
}

module "iam" {
  source = "./iam"
}