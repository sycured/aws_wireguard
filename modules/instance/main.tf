resource "aws_instance" "this" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  associate_public_ip_address = true
  ipv6_address_count          = 1
  subnet_id                   = var.subnet_id
  key_name                    = var.key_pair_name
  root_block_device {
    volume_size = var.root_vol_size
  }
  vpc_security_group_ids = var.sg_ids
  user_data              = var.user_data
}