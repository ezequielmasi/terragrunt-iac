include "root" {
  path = find_in_parent_folders("terragrunt.hcl")
}

terraform {
    source = "tfr:///terraform-aws-modules/iam/aws//modules/iam-policy?version=5.39.1"
}

inputs ={
    name = "usmon-prod-sql-backup-restore"

    description= "Policy for backup and restore of SQL Server"

    policy = <<EOF
    {
    "Version": "2012-10-17",
    "Statement": [
        {
        "Action": [
            "s3:ListBucket",
            "s3:GetObject",
            "s3:PutObject"
        ],
        "Effect": "Allow",
        "Resource": [
            "arn:aws:s3:::usmon-prod-sql-backups-us-west-2",
            "arn:aws:s3:::usmon-prod-sql-backups-us-west-2/*" 
            ]
        }
    ]
    }
    EOF


}