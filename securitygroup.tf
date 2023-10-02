resource "aws_security_group" "first_security_group" {
  vpc_id      = module.mynetwork.vpc_id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [module.mynetwork.vpc_cidr]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]

  }

  tags = {
    Name = "first_security_group"
  }
}

resource "aws_security_group" "second_security_group" {
 
  vpc_id      = module.mynetwork.vpc_id     #aws_vpc.myvpc.id

  ingress {

    from_port        = 3000
    to_port          =3000
    protocol         = "tcp"
  
  }
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [module.mynetwork.vpc_cidr]
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [module.mynetwork.vpc_cidr]
  
  }

  tags = {
    Name = "second_security_group"
  }
}