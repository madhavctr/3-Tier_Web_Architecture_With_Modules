
#Env naming
variable "env_name" {
  default = "poc"
  type    = string
}

#AMI 
variable "ami" {
  default     = "ami-0e4d9ed95865f3b40"
  description = "AMI"
  type        = string
}

#Instance Type
variable "instance_type" {
  default     = "t2.micro"
  description = "instance_type"
  type        = string
}

# Region 
variable "region" {
  default     = "us-west-1"
  description = "Region"
  type        = string
}

#VPC CIDR 
variable "vpc-cidr" {
  default     = "10.0.0.0/16"
  description = "vpc cidr block"
  type        = string
}

#Availability Zone
variable "az1" {
  default     = "us-west-1a"
  description = "Availability Zone (us-west-1a)"
  type        = string
}

variable "az2" {
  default     = "us-west-1b"
  description = "Availability Zone (us-west-1b)"
  type        = string
}

variable "az3" {
  default     = "us-west-1c"
  description = "Availability Zone (us-west-1c)"
  type        = string
}

#Public SubNet
variable "public-subnet1-cidr" {
  default     = "10.0.1.0/24"
  description = "Public Subnet 1 CIDR block"
  type        = string
}

variable "public-subnet2-cidr" {
  default     = "10.0.2.0/24"
  description = "Public Subnet 2 CIDR block"
  type        = string
}

#Private SubNet
variable "private-subnet1-cidr" {
  default     = "10.0.3.0/24"
  description = "Private Subnet 1 CIDR block"
  type        = string
}

variable "private-subnet2-cidr" {
  default     = "10.0.4.0/24"
  description = "Private Subnet 2 CIDR block"
  type        = string
}


#DB Locals 
locals {
  engine               = "mysql"
  engine_version       = "8.0.27"
  family               = "mysql8.0" # DB parameter group
  major_engine_version = "8.0"      # DB option group
  instance_class       = "db.t3.micro"
  allocated_storage    = 20
}