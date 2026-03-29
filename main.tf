module "vpc" {
  source          = "./modules/vpc"
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  region          = var.region
}

module "alb" {
  source         = "./modules/alb"
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnet_ids
}

module "ec2" {
  source        = "./modules/ec2"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  vpc_id        = module.vpc.vpc_id
  alb_sg_id     = module.alb.alb_sg_id

}

module "autoscaling" {
  source             = "./modules/autoscaling"
  launch_template_id = module.ec2.launch_template_id
  private_subnets    = module.vpc.private_subnet_ids
  target_group_arn   = module.alb.target_group_arn
}

module "rds" {
  source          = "./modules/rds"
  private_subnet_ids = module.vpc.private_subnet_ids
  vpc_id          = module.vpc.vpc_id
  db_username     = var.db_username
  db_password     = var.db_password
  app_sg_id = module.ec2.app_sg_id

  providers = {
    aws = aws
    aws.virginia = aws.virginia
  }
}
