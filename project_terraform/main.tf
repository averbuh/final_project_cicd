provider "aws" {
  region = "eu-central-1"

  default_tags {
    tags = {
      hashicorp-learn = "module-use"
    }
  }
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.18.1"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.vpc_azs
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  enable_nat_gateway = var.vpc_enable_nat_gateway

  tags = var.vpc_tags
}

module "ec2_instances" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.2.1"
  count   = 2

  name = "my-ec2-cluster"

  ami                    = "ami-06ce824c157700cd2"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  subnet_id              = module.vpc.public_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}



module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.4.2"

  cluster_name = "myapp-eks-cluster"  
  cluster_version = "1.22"

  subnet_ids = module.vpc.private_subnets
  vpc_id = module.vpc.vpc_id

  tags = {
    environment = "development"
    application = "myapp"
  }

  
}





  















  