resource "aws_security_group" "this" {
  vpc_id = var.vpc_id
  name   = "output"
  ingress {
    from_port        = 22
    protocol         = "tcp"
    to_port          = 22
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = var.cidr_blocks_v6
  }
}