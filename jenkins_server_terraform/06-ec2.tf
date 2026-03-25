# -----------------------------------------
# EC2 Instance
# -----------------------------------------
resource "aws_instance" "jenkins-ec2" {
  ami                    = var.ami
  instance_type          = "t3.medium"
  key_name               = var.key_pair_name
  subnet_id = aws_subnet.public_1.id
  vpc_security_group_ids = [aws_security_group.jenkins_server.id]

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

  user_data_base64 = base64gzip(file("jenkins-setup.sh"))


  tags = {
    Name = "Jenkins-Server"
  }
}

# -----------------------------------------
# Elastic IP (so your IP doesn't change on stop/start)
# -----------------------------------------
resource "aws_eip" "jenkins" {
  instance = aws_instance.jenkins-ec2.id
  domain   = "vpc"
  depends_on = [ aws_instance.jenkins-ec2 ]

  tags = {
    Name = "Jenkins-EIP"
  }
}