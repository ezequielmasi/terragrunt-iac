variable "route_53_record" {
  type = map(object({
    private_zone        = bool
    zone_name           = string
    records_jsonencoded = string
  }))
}
