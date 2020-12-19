provider "aws" {
  version                 = "> 2.69"
  region                  = var.region
  shared_credentials_file = var.shared_credentials_file
  profile                 = var.aws_profile
}
