provider "aws" {
  region = "us-east-1"
}

resource "aws_eip" "lb" {           # Creates EIP
  domain = "vpc"
}

output "public-ip" {
    value = aws_eip.lb.public_ip                        # Will output the created IP
    # value = "https://${aws_eip.lb.public_ip}:8080"    # Will output the IP as a link
}
