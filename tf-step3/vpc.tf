# 특정 기업/개인/단체 등 전용 VPC 생성 선언
resource "aws_vpc" "DE-AI-13-company" {
  # CTDR(Classless Inter-Domain Routing) 규칙 지정 65536개 IP를 구성할 수 있다. 10.0.0.0/16
  # CIDR 블록 크기는 /16에서 /28 => AWS 제약사항
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "DE-AI-13-company-vpc"
  }
}