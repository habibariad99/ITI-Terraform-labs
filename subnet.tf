resource "aws_subnet" "mysubnet" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block="10.0.101.0/24"
    availability_zone="us-east-1a"
    map_public_ip_on_launch=true

tags = {
    Name="mysubnet"
 }

}

resource "aws_subnet" "second-public-subnet" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block="10.0.102.0/24"
    availability_zone="us-east-1b"
    map_public_ip_on_launch=true

tags = {
    Name="second-public-subnet"
 }

}

resource "aws_subnet" "first-private-subnet" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block="10.0.1.0/24"
    availability_zone="us-east-1a"
    
tags = {
    Name="first-private-subnet"
 }
}

resource "aws_subnet" "second-private-subnet" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block="10.0.2.0/24"
    availability_zone="us-east-1b"
    
tags = {
    Name="second-private-subnet"
 }

}





