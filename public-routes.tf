resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.runners_dev.id
  tags = {
    Name = "runners-dev-igw"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.runners_dev.id
  tags = {
    Name = "public-rt-runners-dev"
  }
}

resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public_associations" {
  for_each        = aws_subnet.public
  subnet_id       = each.value.id
  route_table_id  = aws_route_table.public_rt.id
}
