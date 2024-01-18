resource "aws_security_group" "mysg" {
  name        = "Web-Seg"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.my_vpc.id

#to allow inbound HTTP request from anywhere. 
  ingress {
    description      = "HTTP to VPC"
    from_port        = 80
    to_port          = 80 
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
   
  }
  #Inbound rule #2
  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22 
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] #
   
  }
#to allow outbound traffic to anywhere
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Web-seg"
  }
}