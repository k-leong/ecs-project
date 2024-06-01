output "sg" {
  value = aws_security_group.test_sg.id
}

output "alb_sg" {
  value = aws_security_group.alb_sg.id
}