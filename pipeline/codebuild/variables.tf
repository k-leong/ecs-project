variable "role" {
  type = string
}

variable "ecr_repo" {
  type = object({
    repository_url = string
  })
}