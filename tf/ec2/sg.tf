resource "aws_security_group" "app_sg" {
  name = "ssh http https"
  vpc_id = aws_vpc.tf-vpc.id 

  ingress {
    from_port = 22
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "tcp"

  }

  ingress {

  from_port = 443
  to_port = 443
  cidr_blocks = ["0.0.0.0/0"]
  protocol = "tcp"

  }

  tags = {
        Name = "sg"
    }
  
}