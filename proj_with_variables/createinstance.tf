terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "6.12.0"
    }
  }
}


resource "aws_instance" "my_instance" {
  # ami = "ami-0b0ea68c435eb488d"
  ami = "${lookup(var.ami_list , var.AwsDefaultRegion)}"
  instance_type = "t2.micro"
  tags = {
    Name="zee_instance"
  }

  #adding security group
  security_groups = "${var.security_group}"
}


