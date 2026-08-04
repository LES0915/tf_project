# 입력 변수 활용 -> 여러 파일에서 재사용할 공통값, 블록 반복값 구성
locals {
  # 클러스터명 -> 리전 내 EKS > 클러스터를 구분하여 사용
  cluster_name = "${var.project_name}-${var.environment}"

  # Multi-az 관련 ("a", "c") 리소스 사용 시 for_each 키로 활용
  az_keys = ["a", "c"]

  public_subnets = {
    for index, key in local.az_keys : key => {
      az   = var.availability_zones[index]
      cidr = var.public_subnet_cidrs[index]
    }
  }
  #   # 위의 구성으로 나오는 최종 결과
  #   public_subnets = {
  #     a ={
  #         az = "ap-northeast-1a"
  #         cidr = "10.0.1.0/24"
  #     }
  #     c ={
  #         az = "ap-northeast-1c"
  #         cidr = "10.0.2.0/24"
  #     }
  #   }

  # 가용영역이 변경되거나 추가/감소 되거나, cidr 구성이 변경 시 자동처리되게 재구성
  app_subnets = {
    for index, key in local.az_keys : key => {
      az   = var.availability_zones[index]
      cidr = var.app_subnet_cidrs[index]
    }
  }

  db_subnets = {
    for index, key in local.az_keys : key => {
      az   = var.availability_zones[index]
      cidr = var.db_subnet_cidrs[index]
    }
  }

  # 모든 AWS 리소스에 공통으로 적용
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManageBy    = "Terraform"
  }
}