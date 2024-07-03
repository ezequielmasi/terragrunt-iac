include "root" {
  path = find_in_parent_folders("terragrunt.hcl")
}

terraform {}

inputs = {
  s3_bucket = {

    usmon-prod-uploads-us-west-2 = {
      bucket  = "usmon-prod-uploads-us-west-2"
      logging = {}

      versioning = {
        status = false
      }
    },

    usmon-prod-screenshots-us-west-2 = {
      bucket  = "usmon-prod-screenshots-us-west-2"
      logging = {}

      versioning = {
        status = false
      }
    },

    usmon-prod-launch-wizard-us-west-2 = {
      bucket  = "usmon-prod-launch-wizard-us-west-2"
      logging = {}

      versioning = {
        status = false
      }
    },

    usmon-prod-application-artifacts-us-west-2 = {
      bucket  = "usmon-prod-application-artifacts-us-west-2"
      logging = {}

      versioning = {
        status = false
      }
    },

    usmon-prod-sql-backups-us-west-2 = {
      bucket  = "usmon-prod-sql-backups-us-west-2"
      logging = {}

      versioning = {
        status = false
      }
    },

    usmon-prod-application-files-us-west-2 = {
      bucket  = "usmon-prod-application-files-us-west-2"
      logging = {}

      versioning = {
        status = false
      }
    },

    usmon-prod-logs-us-west-2 = {
      bucket                         = "usmon-prod-logs-us-west-2"
      attach_elb_log_delivery_policy = true
      attach_lb_log_delivery_policy  = true
      logging                        = {}

      versioning = {
        status = false
      }
    }
  }
}
