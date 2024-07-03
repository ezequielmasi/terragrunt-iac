# aws/production/environment.hcl

locals {
  account_id     = "546962227516"
  account_name   = "nimbus-general-account"
  bucket         = "nimbus-tf-states-546962227516-us-west-2"
  dynamodb_table = "nimbus-tf-locks-db"
}
