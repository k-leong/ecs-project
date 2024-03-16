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

variable "heroku_api_key" {}

module "heroku" {
  source         = "./heroku"
  heroku_api_key = var.heroku_api_key
}