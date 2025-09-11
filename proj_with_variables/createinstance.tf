terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.12.0"
    }
  }
}

#we are cerating the security gorups
resource "aws_security_group" "sg_tf" {
  name        = "sg_tf"
  description = "my custom seucurity grup"

  dynamic "ingress" {
    for_each = [24,3306,443,80]
    iterator = ports
    content {
      description = "TLS from VPC"
      from_port = ports.value
      to_port = ports.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    
  }





}


# resource "aws_key_pair" "zia_key_pair" {
#   key_name = "zia_key_pair"
#   public_key = file("${path.module}/rsa_id.pub")
# }
# output "test" {
#   value =   "${aws_key_pair.zia_key_pair.key_name}"
# }

# resource "aws_instance" "my_instance" {
#   ami = "${lookup(var.ami_list , var.AwsDefaultRegion)}"
#   instance_type = "t2.micro"
#   key_name = aws_key_pair.zia_key_pair.key_name

#   tags = {
#     Name="zee_instance"
#   }

# #   #adding security group
# #   security_groups = "${var.security_group}"
# }




