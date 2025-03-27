# Set account-wide variables. These are automatically pulled in to configure the remote state bucket in the root
# terragrunt.hcl configuration.
locals {
  account_id  = basename(get_terragrunt_dir())
  prefix      = "prefijo"
}
