# Available Functions: (TF does not support user created functions)
# Numeric, String, Collection, Encoding, Filesystem, Date/Time
# Hash/Crypto, IP Network, Type Conversion

provider "aws" {
    region = var.region
}

locals {
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

variable "region" {
  default = "ap-south-1"
}

variable "tags" {
  type = list
  default = ["firstec2", "secondec2"]
}

variable "ami" {
  type = map
  default = {
    "us-east-1" = "ami-00001"
    "us-west-2" = "ami-00002"
    "ap-south-1" = "ami-00003"
  }
}

resource "aws_key_pair" "loginkey" {
    key_name = "login-key"
    public_key = file("${path.module}/id_rsa.pub")
}

resource "aws_instance" "app-dev" {
  ami = lookup(var.ami,var.region)          # var.ami is the map, var.region gives the key, which then uses in map
  instance_type = "t2.micro"
  key_name = aws_key_pair.loginkey.key_name
  count = 2

    tags = {
        Name = element(var.tags,count.index)
    }
}

output "timestamp" {
  value = local.time
}
