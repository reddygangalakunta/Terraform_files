provider "aws" {
  region = "us-east-1"
}

# VPC Module
module "vpc" {
  source = "./modules/vpc"
  cidr   = var.cidr
}

# Subnet Modules
module "subnet_sub1" {
  source = "./modules/subnet_sub1"
  vpc_id = module.vpc.vpc_id
}

module "subnet_sub2" {
  source = "./modules/subnet_sub2"
  vpc_id = module.vpc.vpc_id
}

# Internet Gateway Module
module "igw" {
  source = "./modules/igw"
  vpc_id = module.vpc.vpc_id
}

# Route Table Module
module "route_table" {
  source = "./modules/route_table"
  vpc_id = module.vpc.vpc_id
  igw_id = module.igw.igw_id
}

# Route Table Association Modules
module "rta1" {
  source    = "./modules/rta1"
  subnet_id = module.subnet_sub1.subnet_id
  rt_id     = module.route_table.rt_id
}

module "rta2" {
  source    = "./modules/rta2"
  subnet_id = module.subnet_sub2.subnet_id
  rt_id     = module.route_table.rt_id
}

# Security Group Module
module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
}

# S3 Bucket Module
module "s3_bucket" {
  source      = "./modules/s3_bucket"
  bucket_name = var.s3_bucket_name
}

# Webserver Instances Modules
module "webserver1" {
  source    = "./modules/webserver1"
  sg_id     = module.security_group.sg_id
  subnet_id = module.subnet_sub1.subnet_id
}

module "webserver2" {
  source    = "./modules/webserver2"
  sg_id     = module.security_group.sg_id
  subnet_id = module.subnet_sub2.subnet_id
}

# Application Load Balancer Module
module "alb" {
  source     = "./modules/alb"
  sg_id      = module.security_group.sg_id
  subnet1_id = module.subnet_sub1.subnet_id
  subnet2_id = module.subnet_sub2.subnet_id
}

# Target Group Module
module "target_group" {
  source = "./modules/target_group"
  vpc_id = module.vpc.vpc_id
}

# Target Group Attachments
module "attach1" {
  source      = "./modules/attach1"
  tg_arn      = module.target_group.tg_arn
  instance_id = module.webserver1.instance_id
}

module "attach2" {
  source      = "./modules/attach2"
  tg_arn      = module.target_group.tg_arn
  instance_id = module.webserver2.instance_id
}

# ALB Listener Module
module "listener" {
  source   = "./modules/listener"
  alb_arn  = module.alb.alb_arn
  tg_arn   = module.target_group.tg_arn
}