terraform {
  backend "s3" {

    bucket = "pengchao2022-terraform-state"

    key = "iam-user/terraform.tfstate"
    
    
    region = "us-east-1"
    
    dynamodb_table = "terraform-state-lock"

    encrypt = true
  }
}