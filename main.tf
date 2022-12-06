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
  webservers      = module.compute.webservers

}

module "compute" {
  source          = "./modules/compute"
  vpc_id          = module.networking.vpc_id
  public_subnet   = module.networking.public_subnets[0]
  private_subnets = module.networking.private_subnets
  bastion-sg      = module.security-groups.bastion_sg
  webserver-sg    = module.security-groups.webserver_sg
  lb_tg           = module.load_balancer.lb_tg
}

module "database" {
  source       = "./modules/database"
  vpc_id       = module.networking.vpc_id
  data_subnets = module.networking.data_subnets
  data-sg      = module.security-groups.data_sg
}