variable "vpc_id" {
  type = string
}

variable "cidr_blocks" {
  type = list(string)
}

variable "cidr_blocks_v6" {
  type = list(string)
}