variable "aws_profile" {
  description = "This is the AWS profile name as set in the shared credentials file"
  type        = string
}

variable "cidr_worldwide_v4" {
  type    = string
  default = "0.0.0.0/0"
}

variable "cidr_worldwide_v6" {
  type    = string
  default = "::/0"
}

variable "region" {
  description = "This is the AWS region"
  type        = string
  default     = "us-east-1"
}

variable "shared_credentials_file" {
  description = "This is the path to the shared credentials file"
  type        = string
  default     = "~/.aws/credentials"
}

variable "ssh_key_name" {
  type = string
}

variable "ssh_public_key" {
  type = string
}

variable "subnet_cidr_block" {
  type    = string
  default = "10.177.77.0/24"
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.177.0.0/16"
}

variable "wireguard_port" {
  type    = number
  default = 443
}

variable "wireguard_server_private_ip" {
  type    = string
  default = "172.16.0.1/24, fd77:77:7::1/64"
}