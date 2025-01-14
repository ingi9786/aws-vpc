# Create Elastic IPs for NAT Gateways
resource "aws_eip" "nat_eips" {
  for_each = toset(var.nat_gateway_azs)
  vpc      = true

  tags = {
    Name = "nat-eip-${each.key}"
  }
}

# Create NAT Gateways
resource "aws_nat_gateway" "nat_gateways" {
  for_each     = toset(var.nat_gateway_azs)
  allocation_id = aws_eip.nat_eips[each.key].id
  subnet_id     = aws_subnet.public[each.key].id

  tags = {
    Name = "nat-gateway-${each.key}"
  }
}


# Create Routes for Private Subnets
resource "aws_route_table" "private_rt" {
  for_each = toset(var.azs)
  vpc_id   = aws_vpc.vpc.id

  tags = {
    Name = "private-rt-${each.key}-${var.environment}"
  }
}

resource "aws_route" "private_routes" {
  for_each               = toset(var.azs)
  route_table_id         = aws_route_table.private_rt[each.key].id
  destination_cidr_block = "0.0.0.0/0"

  # 해당 AZ에 NAT Gateway가 있으면 사용하고, 없으면 첫 번째 NAT Gateway 사용
  nat_gateway_id = contains(var.nat_gateway_azs, each.key) ? aws_nat_gateway.nat_gateways[each.key].id : aws_nat_gateway.nat_gateways[var.nat_gateway_azs[0]].id
}

# Associate Private Subnets with Route Tables
resource "aws_route_table_association" "private_associations" {
  for_each       = toset(var.azs)
  subnet_id      = aws_subnet.private[each.key].id
  route_table_id = aws_route_table.private_rt[each.key].id
}


