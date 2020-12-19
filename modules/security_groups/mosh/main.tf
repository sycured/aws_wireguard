resource "aws_security_group" "this" {
  vpc_id = var.vpc_id
  name   = "mosh"
  ingress {
    from_port        = 60000
    protocol         = "udp"
    to_port          = 61000
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = var.cidr_blocks_v6
  }
}