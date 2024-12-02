resource "aws_vpc_endpoint" "s3" {
  vpc_id             = aws_vpc.runners_dev.id
  service_name       = "com.amazonaws.ap-northeast-2.s3"
  route_table_ids    = [for rt in aws_route_table.private_rt : rt.id] # 모든 private 라우트 테이블 ID 포함
  vpc_endpoint_type  = "Gateway"

  tags = {
    Name = "runners-dev-s3-endpoint"
  }
}
