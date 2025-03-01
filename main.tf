module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"

  instance_type          = "t2.micro"
  monitoring             = false
  vpc_security_group_ids = ["sg-06f76a53f08a418d4"]
  subnet_id              = "subnet-0fdac8dcfac5b59a4"

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name        = "Teste pipeline"
  }
}

terraform {
  backend "s3" {
    bucket = "repo-infra-full"
    key    = "teste"
    region = "sa-east-1"
  }
}
