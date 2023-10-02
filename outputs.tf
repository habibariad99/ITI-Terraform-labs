output vpc_id {
  value= module.mynetwork.vpc_id
}

# output bastion_ip {
#     value = aws_instance.bastion-instance
#     sensitive = true
# }