resource "aws_subnet" "public" {
  for_each              = toset(var.azs)
  vpc_id                = aws_vpc.vpc.id
  cidr_block            = var.subnet_cidrs.public[index(var.azs, each.key)]
  availability_zone     = each.key
  map_public_ip_on_launch = true
  tags = {
    Name = "runners-${var.environment}-${each.key}-public"
  }
}

resource "aws_subnet" "private" {
  for_each              = toset(var.azs)
  vpc_id                = aws_vpc.vpc.id
  cidr_block            = var.subnet_cidrs.private[index(var.azs, each.key)]
  availability_zone     = each.key
  tags = {
    Name = "runners-${var.environment}-${each.key}-private"
  }
}