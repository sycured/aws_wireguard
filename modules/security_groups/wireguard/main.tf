resource "aws_security_group" "this" {
  vpc_id = var.vpc_id
  name   = "wireguard"
  ingress {
    from_port        = var.port
    protocol         = "udp"
    to_port          = var.port
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = var.cidr_blocks_v6
  }
}