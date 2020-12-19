output "id" {
  value = aws_instance.this.id
}

output "ipv6_address" {
  value = aws_instance.this.ipv6_addresses
}

output "public_dns" {
  value = aws_instance.this.public_dns
}

output "public_ip" {
  value = aws_instance.this.public_ip
}