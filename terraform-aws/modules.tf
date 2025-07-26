### vpc module


module "vpc_module" {
  source="./vpc"
  customer = var.customer
  env_name= var.env_name
  vpc_cidr_block = var.vpc_cidr_block
}

### subnet module

module "subnet_module" {
    source = "./subnets"
    customer = var.customer
    env_name= var.env_name
    subnet_cidr_block= var.subnet_cidr_block
    vpc_id= module.vpc_module.vpc_id 
    
}




### sg module

module "sg-module" {
  source="./securty-group"
  customer = var.customer
  env_name= var.env_name
  vpc_id= module.vpc_module.vpc_id 

}



### ec2 module

module "ec2-module" {
  source="./ec2"
  customer = var.customer
  env_name= var.env_name
  subnet_id= module.subnet_module.subnet_id 
  sg_id=module.sg-module.sg_id

}
