module "key_pair" {
  source     = "./modules/key_pair"
  key_name   = var.ssh_key_name
  public_key = var.ssh_public_key
}

module "network" {
  source                 = "./modules/network"
  availability_zone_name = data.aws_availability_zones.available.names[0]
  subnet_cidr_block      = var.subnet_cidr_block
  vpc_cidr_block         = var.vpc_cidr_block
}

module "sg_mosh" {
  source         = "./modules/security_groups/mosh"
  vpc_id         = module.network.vpc_id
  cidr_blocks    = [var.cidr_worldwide_v4]
  cidr_blocks_v6 = [var.cidr_worldwide_v6]
}

module "sg_ssh" {
  source         = "./modules/security_groups/ssh"
  vpc_id         = module.network.vpc_id
  cidr_blocks    = [var.cidr_worldwide_v4]
  cidr_blocks_v6 = [var.cidr_worldwide_v6]
}

module "sg_wireguard" {
  source         = "./modules/security_groups/wireguard"
  vpc_id         = module.network.vpc_id
  port           = var.wireguard_port
  cidr_blocks    = [var.cidr_worldwide_v4]
  cidr_blocks_v6 = [var.cidr_worldwide_v6]
}

module "ec2" {
  source        = "./modules/instance"
  ami_id        = data.aws_ami.ubuntu_focal.id
  key_pair_name = module.key_pair.name
  subnet_id     = module.network.subnet_main_id
  user_data     = data.template_file.user_data.rendered
  sg_ids = [
    data.aws_security_group.default.id,
    module.sg_mosh.id,
    module.sg_ssh.id,
    module.sg_wireguard.id
  ]
}