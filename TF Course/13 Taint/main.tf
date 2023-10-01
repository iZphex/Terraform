provider "aws" {
    region = "us-west-1"  
}

resource "aws_instance" "myec2" {
    ami = "ami=00001"
    instance_type = "t2-micro"
}

# CMD: terraform apply -replace="aws_instance.myec2" 
# This will replace the resources if state was changed manually
