include "root" {
  path = find_in_parent_folders("terragrunt.hcl")
}

terraform {
    source = "tfr:///terraform-aws-modules/iam/aws//modules/iam-user?version=5.39.1"
}


inputs = {
    name = "usmon-prod-sql-backup-restore"
    policy_arns = [
        "arn:aws:iam::546962227516:policy/usmon-prod-sql-backup-restore"
    ]

}