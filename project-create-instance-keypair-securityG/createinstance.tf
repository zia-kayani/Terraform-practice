terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.12.0"
    }
  }
}


resource "aws_instance" "my_instance" {
  ami                    = var.AwsAmi
  instance_type          = var.AwsInstanceType
  key_name               = aws_key_pair.zia_key_pair.key_name
  vpc_security_group_ids = [aws_security_group.sg_tf.id]

  user_data = file("${path.module}/script.sh")

  tags = {
    Name = "zee_instance"
  }


  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("${path.module}/rsa_id")
    host        = self.public_ip
  }


  provisioner "file" {
    source      = "${path.module}/file.txt"
    destination = "/tmp/file.txt"
  }


  provisioner "file" {
    content     = "this is the second file of the instance"
    destination = "/tmp/file1.txt"
  }

  

} #instance ends 





