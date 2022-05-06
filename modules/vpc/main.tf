module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "terraform_vpc"
  cidr = var.settings.vpc_cidr

  azs             = var.settings.azs
  private_subnets = var.settings.private_subnets
  public_subnets  = var.settings.public_subnets

  enable_nat_gateway     = true
  enable_vpn_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
