module "network_east" {
  source     = "./modules/network"
  region     = "us-east-1"
  cidr_block = "10.0.0.0/16"
}

module "network_west" {
  source     = "./modules/network"
  region     = "us-west-2"
  cidr_block = "10.1.0.0/16"

  providers = {
    aws = aws.west
  }
}

# Compute EC2 Web Server
module "compute_east" {
  source         = "./modules/compute"
  subnet_id      = module.network_east.subnet_id
  security_group = module.network_east.security_group_id

  providers = {
    aws = aws.east
  }
}


# Database RDS MySQL
module "database_west" {
  source         = "./modules/database"
  subnet_ids     = module.network_west.subnet_ids
  security_group = module.network_west.security_group_id

  providers = {
    aws = aws.west
  }
}
