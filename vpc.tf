module "vpc" {
  source             = "terraform-aws-modules/vpc/aws"
  name               = var.project_name
  cidr               = var.cidr[0]
  azs                = var.azs
  public_subnets     = var.public_subnets
  enable_ipv6        = "false"
  enable_nat_gateway = "false"
  single_nat_gateway = "true"
  tags               = {
    Name = var.project_name
  }
}
