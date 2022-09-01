variable "main_region" {
  type    = string
  default = "us-east-1"
}

provider "aws" {
  region = var.main_region
  access_key = "AKIAZ32QFUO4ONWFVUVY"
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
