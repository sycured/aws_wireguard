data "aws_ami" "ubuntu_focal" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_security_group" "default" {
  vpc_id = module.network.vpc_id
  name   = "default"
}

data "template_file" "user_data" {
  template = file("${path.module}/templates/user-data.sh")
  vars = {
    wireguard_port              = var.wireguard_port
    wireguard_server_cidr       = var.wireguard_server_cidr
    wireguard_server_private_ip = var.wireguard_server_private_ip
  }
}