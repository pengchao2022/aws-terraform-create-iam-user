provider "aws" {
  region = "us-east-1"
  
}

# call a module
module "iam-users-batch" {
  source = "git::https://github.com/pengchao2022/aws-terraform-modules.git//modules/iam-user?ref=iam-user-1.0"
  
  # read the encrypted key
  pgp_key = "keybase:maxwell0521" # this is keybase.io username

  # enable console login
  create_login_profile = true

  # iam users list
  # when you need to add a new onboard IAM user or remove an IAM user edit here
  iam_users = {
    "kate.winslet"      = { group = "devops" }
    "sophia.zhao"       = { group = "developers" }
    "sean.lim"          = { group = "sre" }
    "jiajia.xiao"       = { group = "sre" }
    "siwei.li"          = { group = "devops" }
    "yiming.zhao"       = { group = "developers"}
  }

  # map permissions
  group_policies = {
    "devops"     = "arn:aws:iam::aws:policy/AdministratorAccess"
    "developers" = "arn:aws:iam::aws:policy/PowerUserAccess"
    "sre"        = "arn:aws:iam::aws:policy/AdministratorAccess"
  }

}

output "aws_account_id" {
  value = module.iam-users-batch.aws_account_id
}

# outputs the whol map credentials
output "iam_users_credentials" {
  value     = module.iam-users-batch.iam_users_login_info
  sensitive = true
}

# outputs the aws console login url
output "aws_console_login_url" {
  value = module.iam-users-batch.aws_console_login_url
}
