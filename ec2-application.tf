resource "aws_instance" "app" {
  ami = "ami-03a6eaae9938c858c"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.first-private-subnet.id
  vpc_security_group_ids= [aws_security_group.second_security_group.id]
  key_name = aws_key_pair.generated_key_pair.id

  tags = {
    Name = "private-ec2"
  }
}