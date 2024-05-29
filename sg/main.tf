resource "aws_security_group" "test_sg" {
  vpc_id = var.vpc_id

  tags = {
    Name = "test security group"
  }
}

resource "aws_security_group_rule" "test_sg_rule" {
  type = "ingress"
  from_port = 0
  to_port = 65535
  protocol = "all"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.test_sg.id
}

resource "aws_security_group_rule" "test_sg_rule2" {
  type = "egress"
  from_port = 0
  to_port = 65535
  protocol = "all"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.test_sg.id
}

resource "aws_security_group" "alb_sg" {
  vpc_id = var.vpc_id

  tags = {
    Name = "alb security group"
  }
}

resource "aws_security_group_rule" "alb_sg_rule" {
  type = "ingress"
  from_port = 0
  to_port = 65535
  protocol = "all"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.alb_sg.id
}