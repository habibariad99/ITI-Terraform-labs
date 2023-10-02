resource "aws_instance" "bastion-instance" {
    ami = var.ami_id  #"ami-03a6eaae9938c858c"
    instance_type =var.instance_type     #"t2.micro"
    subnet_id = module.mynetwork.public_subnets[0].id
    key_name = aws_key_pair.generated_key_pair.id

    
    provisioner "local-exec" {
      command = "echo ${self.public_ip} > inventory"
    }
    #vpc_id= aws_vpc.myvpc.id
    vpc_security_group_ids= [aws_security_group.first_security_group.id]
    associate_public_ip_address= true
    tags = {
      Name="public-ec2"
    }

    user_data = <<-EOF
                   #!/bin/bash
                   echo'${tls_private_key.terrafrom_generated_private_key.private_key_pem}' > /'home/ec2-user/private_key.pem'
                   chmod 400 private_key.pem
                   EOF
}