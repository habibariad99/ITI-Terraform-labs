resource "aws_instance" "app" {
  ami = var.ami_id          #"ami-03a6eaae9938c858c"
  instance_type = var.instance_type # "t2.micro"
  subnet_id = module.mynetwork.private_subnets[0].id
  vpc_security_group_ids= [aws_security_group.second_security_group.id]
  key_name = aws_key_pair.generated_key_pair.id

  tags = {
    Name = "private-ec2"
  }
}