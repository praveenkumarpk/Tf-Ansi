resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = var.instance_typee 
  subnet_id = aws_subnet.public-1.id
  key_name = "app"
  security_groups = [aws_security_group.app_sg.id]
  tags = {
    Name = "tftest"
  }

   root_block_device {
    volume_size = "11"

   }
}

#resource "aws_ebs_volume" "pp_ebs" {
#  availability_zone = "us-west-2b"
#  size = "10"
#  tags = {
#    Name = "app-vol"
#  }
#}

#resource "aws_volume_attachment" "app-ebs"{

#  device_name = "/dev/sdh"
#  volume_id = aws_ebs_volume.pp_ebs.id 
#  instance_id = aws_instance.app_server.id 
#}

#EIP

resource "aws_eip" "app-ip" {
  vpc = true
  instance = aws_instance.app_server.id 

  tags = {
    Name = "eip1"
  }
}
