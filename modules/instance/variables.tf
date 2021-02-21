variable "ami_id" {
  type = string
}

variable "http_endpoint" {
  description = "enable or disable metadata service"
  default     = "enabled"
}

variable "http_tokens" {
  description = "requires session tokens, also referred to as Instance Metadata Service Version 2 (IMDSv2)"
  default     = "required"
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