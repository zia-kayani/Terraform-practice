terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.12.0"
    }
  }
}


resource "aws_instance" "my_instance" {
  ami = var.AwsAmi
  instance_type = var.AwsInstanceType
  key_name = aws_key_pair.zia_key_pair.key_name
  vpc_security_group_ids = [aws_security_group.sg_tf.id]
  
  user_data = file("${path.module}/script.sh")

  tags = {
    Name="zee_instance"
  }

}




