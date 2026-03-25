


# for web server only 
resource "aws_security_group" "jenkins_server" {
  name        = "jenkins_server"
  description = "Jenkins"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "Jenkins"
  }
}

resource "aws_vpc_security_group_ingress_rule" "jenkins_ui" {
  security_group_id = aws_security_group.jenkins_server.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 8080
  ip_protocol = "tcp"
  to_port     = 8080
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.jenkins_server.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "egress" {
  security_group_id = aws_security_group.jenkins_server.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}