include "root" {
  path = find_in_parent_folders()
}

terraform {}

inputs = {
  route_53_record = {
    database = {
      private_zone = true
      zone_name    = "usmon.local"
      records_jsonencoded = jsonencode([
        {
          name    = "database"
          type    = "A"
          ttl     = 3600
          records = ["10.0.12.5"]
        }
      ])
    }
  }
}
