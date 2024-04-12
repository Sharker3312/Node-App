
provider "aws" {
  region = "us-east-2" 
}

resource "aws_instance" "ec2_instance" {
  ami           = "ami-00cda30cf72311684" 
  instance_type = "t2.micro" 
  key_name = "ec2_key"
  security_groups = [module.security_group.ec2_security_group_id]         

  tags = {
    Name = "Nodeapp"
  }
}

module "security_group" {
  source = "./module/security_group"
}

