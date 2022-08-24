provider "aws" {
  region  = var.region
  profile = "madhavchittepu"
}

#### VPC Module ####
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.env_name}-vpc"
  cidr = var.vpc-cidr

  azs             = [var.az1, var.az2]
  public_subnets  = [var.private-subnet1-cidr, var.private-subnet2-cidr]
  private_subnets = [var.public-subnet1-cidr, var.public-subnet2-cidr]

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway = true
  single_nat_gateway = true

  create_igw = true

  tags = {
    Terraform   = "true"
    Environment = var.env_name
  }
}

#### Web Security group Module ####

module "web-sg" {
  source       = "terraform-aws-modules/security-group/aws"
  egress_rules = ["all-all"]


  name                = "${var.env_name}-websg"
  description         = "Security group for web app"
  depends_on          = [module.vpc]
  vpc_id              = module.vpc.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "ssh-tcp"]

}

#### DB Security group Module ####
module "db-sg" {
  source = "terraform-aws-modules/security-group/aws"

  name                = "${var.env_name}-dbsg"
  description         = "Security group for db"
  depends_on          = [module.vpc]
  vpc_id              = module.vpc.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["ssh-tcp", "mysql-tcp", "postgresql-tcp", "http-80-tcp"]
  egress_rules        = ["all-all"]

}

#### Bastian Security group Module ####
module "bastian-sg" {
  source = "terraform-aws-modules/security-group/aws"

  name                = "${var.env_name}-bastiansg"
  description         = "Security group for web app"
  depends_on          = [module.vpc]
  vpc_id              = module.vpc.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["ssh-tcp"]
  egress_rules        = ["all-all"]

}

#### EC2-Instance Module ####
module "ec2_bastian" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "${var.env_name}-bastianhost"

  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [module.bastian-sg.security_group_id]
  subnet_id              = element(module.vpc.public_subnets, 0)

  tags = {
    Terraform   = "true"
    Environment = var.env_name
  }
}

#### external ALB Module ####
module "external-alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 6.0"

  name = "${var.env_name}-albexternal"

  load_balancer_type = "application"

  vpc_id          = module.vpc.vpc_id
  subnets         = module.vpc.public_subnets
  security_groups = [module.web-sg.security_group_id]

  target_groups = [
    {
      name_prefix      = "pref-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = {
    Environment = "${var.env_name}-external"
  }
}

#### internal ALB Module ####
module "internal-alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 6.0"

  name = "${var.env_name}-albinternal"

  load_balancer_type = "application"

  vpc_id          = module.vpc.vpc_id
  subnets         = module.vpc.private_subnets
  security_groups = [module.db-sg.security_group_id]

  target_groups = [
    {
      name_prefix      = "pref-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = {
    Environment = "${var.env_name}-internal"
  }
}

#DB module
module "db-master" {
  source = "terraform-aws-modules/rds/aws"

  identifier             = "${var.env_name}-master"
  subnet_ids             = module.vpc.private_subnets
  vpc_security_group_ids = [module.db-sg.security_group_id]
  engine                 = local.engine
  engine_version         = local.engine_version
  major_engine_version   = local.major_engine_version
  family                 = local.family         #DB parameter group
  instance_class         = local.instance_class #DB option group
  create_db_subnet_group = true                 #DB subnet group

  allocated_storage       = local.allocated_storage
  backup_retention_period = 1 #Backups are required in order to create a replica
  skip_final_snapshot     = true
  deletion_protection     = false

  db_name  = "masterdb"
  username = "poc"
  password = "POCDBpocdb"

}
#Replicate DB module
module "db-replica" {
  source = "terraform-aws-modules/rds/aws"

  identifier             = "${var.env_name}-replica"
  replicate_source_db    = module.db-master.db_instance_id
  engine                 = local.engine
  major_engine_version   = local.major_engine_version
  family                 = local.family         #DB parameter group
  instance_class         = local.instance_class #DB option group
  allocated_storage      = local.allocated_storage
  deletion_protection    = false
  skip_final_snapshot    = true
  subnet_ids             = module.vpc.private_subnets
  vpc_security_group_ids = [module.db-sg.security_group_id]
}

#S3 module 
module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "${var.env_name}-s3bucketttt"
  acl    = "private"

  versioning = {
    enabled = true
  }

}

#Launch Template Module
module "launch_template_only" {
  source = "terraform-aws-modules/autoscaling/aws"

  create = false
  name   = "launch-template-only-${var.env_name}"

  vpc_zone_identifier = module.vpc.public_subnets
  min_size            = 2
  max_size            = 4
  desired_capacity    = 2

  image_id      = var.ami
  instance_type = var.instance_type

}
