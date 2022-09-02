variable "main_region" {
  type    = string
  default = "us-east-1"
}

provider "aws" {
  region = var.main_region
  access_key = "AKIAZ32QFUO4A7ONHUNZ"
  secret_key = "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"
}

module "vpc" {
  source = "./module/vpc"
  region = var.main_region
}

resource "aws_instance" "my-instance" {
  ami           = module.vpc.ami_id
  subnet_id     = module.vpc.subnet_id
  instance_type = "t2.micro"
}
