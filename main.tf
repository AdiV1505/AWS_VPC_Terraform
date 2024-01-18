resource "aws_vpc" "my_vpc" {
 tags = {
   Name="Terraform-project-vpc"
 }
  cidr_block = var.cidr
}

#Creating first subnet

resource "aws_subnet" "sb1" {
    vpc_id=aws_vpc.my_vpc.id
    cidr_block = var.cidr_sb1
    availability_zone = var.region_sb1
    map_public_ip_on_launch = true #indicates that the subnet is a public subnet
}

#Creating Second subnet

resource "aws_subnet" "sb2" {
    vpc_id=aws_vpc.my_vpc.id
    cidr_block = var.cidr_sb2
    availability_zone = var.region_sb2
    map_public_ip_on_launch = true 
}

#Creating the internet gateway to connect the VPC with the Internet

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id
}


resource "aws_instance" "webserver1" {
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.mysg.id]
    subnet_id = aws_subnet.sb1.id
    user_data_base64=base64encode(file("userdata1.sh"))
}

resource "aws_instance" "webserver2" {
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.mysg.id]
    subnet_id = aws_subnet.sb2.id
    user_data_base64=base64encode(file("userdata2.sh"))
}
 