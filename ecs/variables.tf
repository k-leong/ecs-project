variable "subnets" {
  type = map(string)
}

variable "aws_ecr_repository" {
  type = object({
    repository_url = string
  })
}

variable "execution_role" {
  type = string
}

variable "container_image" {
  type = string
}

variable "sg" {
  type = string
}

variable "alb_target_group" {
  type = string
}