provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "instance-1" {
  ami = "ami-082b5a644766e0e6f"
  instance_type = "t2-micro"
  count = 3                                 # creates 3 of the same resource
}

resource "aws_iam_user" "lb" {
  name = "loadbalancer.${count.index}"     # adds a # at the end of the name
  count = 5
  path = "/system/"
}


variable "elb_names" {
  type = list
  default = ["dev-loadblancer", "stage-loadbalancer", "prod-loadblance"]
}

resource "aws_iam_user" "lb" {
  name = var.elb_names[count.index]         # uses names var to name the users
  count = 3
  path = "/system/"
}
