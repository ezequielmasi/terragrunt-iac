## GENERAL

project     = "common"
environment = "prod"
layer       = "persistence"
region      = "us-east-1"
team        = "DevOps"

## DNS PUBLIC

dns_public = {
  #  "example.com" = { create = false, comment = "Esto es un comentario" },
}

## ECR

ecr_repositories = {
  "access-backup-manager" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "access-session-api" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "access-ssh-tunnel" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "apache2-backend" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "api-backend" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "api-edge" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "api-fup" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "api-fup-metrics-exporter" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "asternic" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "auvik-webhook-api" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "aws/cli" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "backup-manager" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "chromecast-token-api" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "chromecast-token-worker" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "cloudone-pms-api" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "cloudone-pms-contactless-mirror" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "cloudone-pms-guest-in-house-mirror" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "cloudone-pms-interface" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "cloudone-pms-mirror" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "cloudone-pms-proxy" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "cloudone-pms-scheduler" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "codebuild/php" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "contactless-backend" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "contactless-backoffice" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "contactless-front" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "crm" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "crm-history" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "deploy-backend" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "fop2" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "gc-freeradius-3" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "gc-pms-emule" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "gc-ros-emule" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "gc-rrdtool" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "gc-whisper" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "go-rabbit" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "gosmtp" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "gotools" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "gotools-api-pms" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "grafana" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "guestaccess-api-backoffice" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "guestaccess-api-backoffice-base" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "guestaccess-api-edge" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "guestaccess-api-edge-base" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "guestaccess-api-fup" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "guestaccess-api-fup-base" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "guestaccess-backoffice" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "guestaccess-bandwidth-calendar" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "guestaccess-fup" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "guestaccess-print" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "help.me" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "hitalos-laravel" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "jenkins-fup" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "nginx" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "nginx-backend" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "nginx-fup" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "nginx-servicios-1" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "nimbi2.0" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "opendns-scheduler" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "pbx" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "pbx-mailalertcall" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "php-fpm-backend" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "php-fpm-fup" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "pms" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "pms-emule-micros" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "pms-interface-htng" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "portainer" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "prometheus" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "radius" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "radius-7-6" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "radius-go" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "radius-mac-auth" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "radius3" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "remote-syslog" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "siptrunk" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "spa-form-backend" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "test-deploy" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "tracker-crm" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "tracker-crm-uat" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "twilio-webhook" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "vycontrol" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "webnimbus-api" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  },
  "webphone" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 500
  }
}