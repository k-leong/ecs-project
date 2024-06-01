resource "aws_security_group" "test_sg" {
  vpc_id = var.vpc_id

  tags = {
    Name = "test security group"
  }
}

resource "aws_security_group_rule" "test_sg_rule" {
  type = "ingress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.test_sg.id
}

resource "aws_security_group_rule" "test_sg_rule2" {
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.test_sg.id
}

resource "aws_security_group" "alb_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "alb security group"
  }
}

resource "aws_security_group_rule" "alb_sg_rule" {
  type = "ingress"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  security_group_id = aws_security_group.alb_sg.id
  source_security_group_id = aws_security_group.ecs_sg.id

  depends_on = [ aws_security_group.ecs_sg ]
}

resource "aws_security_group" "ecs_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_groups = [ aws_security_group.alb_sg.id ]
  }

  egress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_groups = [ aws_security_group.alb_sg.id ]
  }

  tags = {
    Name = "ecs security group"
  }
}
