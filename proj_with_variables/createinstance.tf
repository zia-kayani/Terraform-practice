terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "6.12.0"
    }
  }
}


resource "aws_instance" "my_instance" {
  ami = "ami-0b0ea68c435eb488d"
  instance_type = "t2.micro"
  tags = {
    Name="zee_instance"
  }
}