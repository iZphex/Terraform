provider "aws" {
  region     = "us-west-1"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "myec2" {
    ami = "ami-06d2c6c1b5cbaee5f"
    instance_type = "t2.micro"

    tags = {
        Name = "HellowWorld"
    }
}
