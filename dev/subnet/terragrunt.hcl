include "root" {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../vpc"
}

terraform {
  source = "github.com/nVizzz/IntroTask1_Terraform.git//modules/subnet?ref=v0.0.24"
}
inputs = {
  azs             = 3
  subnets_public  = ["10.10.11.0/24", "10.10.12.0/24", "10.10.13.0/24"]
  subnets_private = ["10.10.21.0/24", "10.10.22.0/24", "10.10.23.0/24", "10.10.31.0/24", "10.10.32.0/24", "10.10.33.0/24"]
  vpc_id          = dependency.vpc.outputs.vpc_id
}

dependencies {
  paths = ["../vpc"]
}
