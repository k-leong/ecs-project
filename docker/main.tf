resource "null_resource" "build_docker_image" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "docker build -t my_image:latest ./app"
  }

  depends_on = [var.aws_ecr_repository]
}

resource "null_resource" "push_to_ecr" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = <<EOF
      aws ecr get-login-password --region ${var.aws_region} | docker login --username AWS --password-stdin ${var.aws_ecr_repository.repository_url}
      docker tag my_image:latest ${var.aws_ecr_repository.repository_url}:latest
      docker push ${var.aws_ecr_repository.repository_url}:latest
    EOF
  }

  depends_on = [null_resource.build_docker_image]
}