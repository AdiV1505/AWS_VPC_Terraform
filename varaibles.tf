variable "cidr" {
    description="IP range for our entire VPC"
    type=string
  
}
variable "cidr_sb1" {
    description="IP range for subnet1"
    type=string
  
}
variable "cidr_sb2" {
    description="IP range for our subnet2"
    type=string
  
}

variable "region_sb1" {
    description="region for our subnet1"
    type=string
  
}
variable "region_sb2" {
    description="region for our subnet2"
    type=string
  
}

variable "ami_id" {
    description="AmiId to select the OS for the instance"
    type=string
  
}

variable "instance_type" {
	description=" to describe the type of instance we are trying to create"
	type=string
}