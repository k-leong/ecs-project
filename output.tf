output "subnet" {
  value = module.vpc.public_subnet_ids
}

output "ecr_repo" {
  value = module.ecr.aws_ecr_repository
}