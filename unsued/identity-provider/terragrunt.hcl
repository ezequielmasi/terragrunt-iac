include "root" {
  path = find_in_parent_folders()
}

terraform {}

inputs = {
  name        = "usmon-prod-github-actions"
  subjects    = ["US-Monitoring/*:*"]
  policy_name = "usmon-prod-github-actions"
}
