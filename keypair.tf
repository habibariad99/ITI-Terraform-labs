resource "tls_private_key" "terrafrom_generated_private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key_pair" {
  
  # Name of key: Write the custom name of your key
  key_name   = "keys_pairs"
  
  # Public Key: The public will be generated using the reference of tls_private_key.terrafrom_generated_private_key
  public_key = tls_private_key.terrafrom_generated_private_key.public_key_openssh
}

resource "local_file" "generated_key" {
  content = tls_private_key.terrafrom_generated_private_key.private_key_pem
  filename = "keys_pairs.pem"
}