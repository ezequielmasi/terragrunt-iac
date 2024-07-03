data "aws_partition" "current" {}
data "aws_caller_identity" "current" {}

locals {
  provider_url = replace(var.provider_url, "https://", "")
  account_id   = data.aws_caller_identity.current.account_id
  partition    = data.aws_partition.current.partition
}

module "iam_github_oidc_provider" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-github-oidc-provider"
  version = "5.39.1"
}

resource "aws_iam_policy" "iam_policy" {
  name   = var.policy_name
  path   = "/"
  policy = templatefile("custom-policies/github-actions-access.json", {})
}

data "aws_iam_policy_document" "iam_policy_document" {
  statement {
    sid    = "GithubOidcAuth"
    effect = "Allow"
    actions = [
      "sts:TagSession",
      "sts:AssumeRoleWithWebIdentity"
    ]

    principals {
      type        = "Federated"
      identifiers = ["arn:${local.partition}:iam::${local.account_id}:oidc-provider/${local.provider_url}"]
    }

    condition {
      test     = "ForAllValues:StringEquals"
      variable = "token.actions.githubusercontent.com:iss"
      values   = ["https://token.actions.githubusercontent.com"]
    }

    condition {
      test     = "ForAllValues:StringEquals"
      variable = "${local.provider_url}:aud"
      values   = [var.audience]
    }

    condition {
      test     = "StringLike"
      variable = "${local.provider_url}:sub"
      # Strip `repo:` to normalize for cases where users may prepend it
      values = [for subject in var.subjects : "repo:${trimprefix(subject, "repo:")}"]
    }
  }
}

resource "aws_iam_role" "iam_github_oidc_role" {
  name        = var.name
  name_prefix = var.name_prefix
  path        = var.path
  description = var.description

  assume_role_policy    = data.aws_iam_policy_document.iam_policy_document.json
  max_session_duration  = var.max_session_duration
  permissions_boundary  = var.permissions_boundary_arn
  force_detach_policies = var.force_detach_policies

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "iam_role_policy_attachment" {
  role       = aws_iam_role.iam_github_oidc_role.name
  policy_arn = aws_iam_policy.iam_policy.arn
}
