variable "ami_id" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t3a.micro"
}

variable "key_pair_name" {
  type = string
}

variable "root_vol_size" {
  type    = number
  default = 50
}

variable "sg_ids" {
  type = list(string)
}

variable "subnet_id" {
  type = string
}

variable "user_data" {
  type = string
}