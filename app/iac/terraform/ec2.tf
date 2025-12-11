module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "Novintix"

  instance_type = "t3.micro"
  key_name      = "mykeypair"
  monitoring    = true
  subnet_id     = module.vpc.public_subnets

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}