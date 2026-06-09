# aws-terraform-create-iam-user
This repository demo is used for AWS admins, DevOps, SRE who manage the AWS IAM Users. the terraform will automatically create IAM users and groups and assign perssions for users, User



## Usage

- install gpg on your local computer for example on Mac
```shell
brew install gpg
```
- generate pgp keys
```shell
gpg --full-generate-key
```
- get the gpg key for terraform
```shell
gpg --armor --export <your email address when you generate gpg typed> | base64 -w 0
```

