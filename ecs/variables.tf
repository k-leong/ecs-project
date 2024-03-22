variable "subnets" {
  type = list(string)
}

variable "aws_ecr_repository" {
  type = object({
    repository_url = string
  })
}