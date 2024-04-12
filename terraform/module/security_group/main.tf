resource "aws_security_group" "ec2_security_group" {
  name        = "example-security-group"
  description = "Allow inbound traffic on port 8080 and SSH"
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
output "ec2_security_group_id" {
  value = aws_security_group.ec2_security_group.id
}
