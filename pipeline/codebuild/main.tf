resource "aws_codebuild_project" "codebuild" {
  name = "tf-codebuild"
  description = "codebuild tf test"
  service_role = var.role

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    image = "aws/codebuild/amazonlinux2-x86_64-standard:5.0"
    type = "LINUX_CONTAINER"
    compute_type = "BUILD_GENERAL1_SMALL"

    environment_variable {
      name = "test"
      value = "hello world"
    }

    environment_variable {
      name = "ECR_REPO"
      value = var.ecr_repo.repository_url
    }
  }

  source {
    type = "GITHUB"
    location = "https://github.com/k-leong/aws-ecs-project.git"
    git_clone_depth = 0
    buildspec = file("${path.module}/buildspec.yml")
  }
}