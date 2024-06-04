module "test" {
  source = "./codebuild"

  role = module.iam.codebuild_role
  ecr_repo = module.ecr.aws_ecr_repository
}

module "iam" {
  source = "./iam"
}

module "ecr" {
  source = "../ecr"
}