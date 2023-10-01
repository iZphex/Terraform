provider "aws" {
  region = "us-west-2"
}

variable "is-test" {
  
}

resource "aws_instance" "dev" {
  ami = "ami-0000000"
  instance_type = "t2-micro"
  count = var.is-test == true ? 3 : 0       # if is-test = true will create 3, if false = 0
}

resource "aws_instance" "prod" {
  ami = "ami-0000000"
  instance_type = "t2.large"
  count = var.is-test == false ? 1 : 0
}
