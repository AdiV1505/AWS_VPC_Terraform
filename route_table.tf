resource "aws_route_table" "RT" {
    vpc_id = aws_vpc.my_vpc.id
    route {
        cidr_block="0.0.0.0/0"
        gateway_id= aws_internet_gateway.igw.id
    }
}


resource "aws_route_table_association" "rta1" {
    subnet_id = aws_subnet.sb1.id
    route_table_id = aws_route_table.RT.id
}

resource "aws_route_table_association" "rta2" {
    subnet_id = aws_subnet.sb2.id
    route_table_id = aws_route_table.RT.id
}
