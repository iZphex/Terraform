resource "aws_instance" "myec2" {
  ami = "ami-00001"
  instance_type = "t2.micro"
}
