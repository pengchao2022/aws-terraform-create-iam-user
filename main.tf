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
  iam_users = {
    "kate.winslet"      = { group = "devops" }
    "sophia.zhao"       = { group = "developers" }
    "sean.lim"          = { group = "sre" }
    "jiajia.xiao"       = { group = "sre" }
  }

  # map permissions
  group_policies = {
    "devops"     = "arn:aws:iam::aws:policy/AdministratorAccess"
    "developers" = "arn:aws:iam::aws:policy/PowerUserAccess"
    "sre"        = "arn:aws:iam::aws:policy/AdministratorAccess"
  }

}

# 直接输出整个模块的凭证 Map，不要在外部包裹
output "iam_users_credentials" {
  value     = module.iam-users-batch.iam_users_login_info
  sensitive = true
}

# 单独输出登录 URL
output "aws_console_login_url" {
  value = module.iam-users-batch.aws_console_login_url
}
