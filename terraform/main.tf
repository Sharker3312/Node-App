
provider "aws" {
  region = "us-east-2" #Region as you wish
}

resource "aws_instance" "nodeapp" {   
  ami           = "ami-0b8b44ec9a8f90422" #Check the AMI list for free tier
  instance_type = "t2.micro" #Well... very intuitive -_-
  key_name = "ec2_key" #Name of key pair created in step 3
  vpc_security_group_ids = [aws_security_group.nodeapp.id] # ID security group
     

  tags = {
    Name = "Nodeapp"
  }
}

#Security Group
resource "aws_security_group" "nodeapp" {
  name        = "ec2_ecurity-group" #Whatever name
  description = "Allow inbound traffic on port 8080 and SSH" #The app expose port  8080
  

  
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

}



