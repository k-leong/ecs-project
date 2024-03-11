variable "aws_ecr_repository" {
  type = object({
    repository_url = string
  })
}

variable "aws_region" {
  type = string
}