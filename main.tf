module "networking" {
  source    = "./modules/networking" 
  my_public_ip  = module.access_ip.my_public_ip
  
}
module "access_ip" {
  source = "./modules/access_ip"
  
}

module "security-groups"{
  source = "./modules/security-groups"
  vpc_id = module.networking.vpc_id
  vpc_cidr_block = module.networking.vpc_cidr_block
  private_subnets = module.networking.private_subnets
  public_subnets  = module.networking.public_subnets
  data_subnets = module.networking.data_subnets 
  my_public_ip  = module.access_ip.my_public_ip
}