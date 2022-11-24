module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "3.18.1"

  
  
 
  
  name = "main"
  cidr = var.vpc_cidr

  azs              = [var.availability_zone_names[0], var.availability_zone_names[1]]
  public_subnets   = [var.public_cidr[0], var.public_cidr[1]]
  private_subnets  = [var.private_cidr[0], var.private_cidr[1]]
  database_subnets = [var.data_cidr[0], var.data_cidr[1]]


  create_database_subnet_group = true
  
  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  enable_dns_hostnames = true
  enable_dns_support   = true

  public_dedicated_network_acl = true
  public_inbound_acl_rules = [ {
    "cidr_block":  var.my_public_ip, 
    "from_port": 22, 
    "to_port": 22,
    "protocol": "tcp", 
    "rule_action": "allow", 
    "rule_number": 100    
    },
    {
    "cidr_block": "0.0.0.0/0", 
    "from_port": 80, 
    "to_port": 80,
    "protocol": "tcp", 
    "rule_action": "allow", 
    "rule_number": 200    
    } ,
    {
    "cidr_block": "0.0.0.0/0", 
    "from_port": 0, 
    "to_port": 0,
    "protocol": "-1", 
    "rule_action": "deny", 
    "rule_number": 300    
    }
    ]


  private_dedicated_network_acl  = true
  private_inbound_acl_rules = [ {
    "cidr_block": var.my_public_ip, 
    "from_port": 22, 
    "to_port": 22,
    "protocol": "tcp", 
    "rule_action": "allow", 
    "rule_number": 100    
    },
    {
    "cidr_block": "0.0.0.0/0", 
    "from_port": 80, 
    "to_port": 80,
    "protocol": "tcp", 
    "rule_action": "allow", 
    "rule_number": 200    
    } ,
    {
    "cidr_block": "0.0.0.0/0", 
    "from_port": 0, 
    "to_port": 0,
    "protocol": "-1", 
    "rule_action": "deny", 
    "rule_number": 300    
    }
    ]

  tags = {
    Environment   = "DEV"
    
  }
}
