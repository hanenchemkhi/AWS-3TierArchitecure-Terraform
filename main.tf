module "networking" {
  source       = "./modules/networking"
  my_public_ip = module.access_ip.my_public_ip

}
module "access_ip" {
  source = "./modules/access_ip"

}

module "security-groups" {
  source          = "./modules/security-groups"
  vpc_id          = module.networking.vpc_id
  vpc_cidr_block  = module.networking.vpc_cidr_block
  private_subnets = module.networking.private_subnets
  public_subnets  = module.networking.public_subnets
  data_subnets    = module.networking.data_subnets
  my_public_ip    = module.access_ip.my_public_ip
}

module "load_balancer" {
  source          = "./modules/load_balancer"
  vpc_id          = module.networking.vpc_id
  private_subnets = module.networking.private_subnets
  security_groups = module.security-groups.alb_sg

}

module "compute"{
  source = "./modules/compute"
  vpc_id = module.networking.vpc_id
  subnet = module.networking.public_subnets[0]
  bastion-sg = module.security-groups.bastion_sg
}