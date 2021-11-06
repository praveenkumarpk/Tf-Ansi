
resource "aws_vpc" "tf-vpc"{
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "terraVpc"
  }
}

resource "aws_subnet" "public-1"{
  vpc_id = aws_vpc.tf-vpc.id
  availability_zone = "us-west-2b"
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "public-subnet"
  }
}