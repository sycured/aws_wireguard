output "ec2_ipv6_addr" {
  value = module.ec2.ipv6_address
}

output "ec2_public_ip" {
  value = module.ec2.public_ip
}

output "ec2_dns" {
  value = module.ec2.public_dns
}