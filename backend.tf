terraform{
  backend "s3" {
  bucket = "habiba-s3-bucket"
  key ="terraform.tfstate" 
  region = "us-east-1" 
  dynamodb_table = "habiba-terraform-dynamo-db"
  }
}