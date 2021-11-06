resource "aws_internet_gateway" "ig-app" {
   vpc_id = aws_vpc.tf-vpc.id 
   tags = {
    Name = "ip-app"
   }
}

resource "aws_route_table" "app-route" {
  vpc_id = aws_vpc.tf-vpc.id 

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig-app.id 
  }
tags = {
  Name = "route-ap"
}
}

resource "aws_route_table_association" "rt-assoc" {
   subnet_id = aws_subnet.public-1.id 
   route_table_id = aws_route_table.app-route.id 
}  