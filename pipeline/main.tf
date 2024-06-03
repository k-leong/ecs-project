module "test" {
  source = "./codebuild"

  role = module.iam.codebuild_role
}

module "iam" {
  source = "./iam"
}