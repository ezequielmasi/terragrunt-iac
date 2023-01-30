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
    max_tagged_image_count   = 100
  },
  "access-session-api" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "access-ssh-tunnel" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "apache2-backend" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "api-backend" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "api-edge" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "api-fup" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "api-fup-metrics-exporter" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "asternic" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "auvik-webhook-api" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "aws/cli" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "backup-manager" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "chromecast-token-api" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "chromecast-token-worker" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "cloudone-pms-api" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "cloudone-pms-contactless-mirror" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "cloudone-pms-guest-in-house-mirror" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "cloudone-pms-interface" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "cloudone-pms-mirror" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "cloudone-pms-proxy" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "cloudone-pms-scheduler" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "codebuild/php" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "contactless-backend" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "contactless-backoffice" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "contactless-front" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "crm" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "crm-history" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "deploy-backend" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "fop2" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "gc-freeradius-3" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "gc-pms-emule" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "gc-ros-emule" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "gc-rrdtool" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "gc-whisper" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "go-rabbit" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "gosmtp" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "gotools" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "gotools-api-pms" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "grafana" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "guestaccess-api-backoffice" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "guestaccess-api-backoffice-base" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "guestaccess-api-edge" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "guestaccess-api-edge-base" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "guestaccess-api-fup" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "guestaccess-api-fup-base" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "guestaccess-backoffice" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "guestaccess-bandwidth-calendar" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "guestaccess-fup" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "guestaccess-print" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "help.me" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "hitalos-laravel" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "jenkins-fup" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "nginx" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "nginx-backend" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "nginx-fup" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "nginx-servicios-1" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "nimbi2.0" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "opendns-scheduler" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "pbx" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "pbx-mailalertcall" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "php-fpm-backend" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "php-fpm-fup" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "pms" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "pms-emule-micros" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "pms-interface-htng" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "portainer" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "prometheus" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "radius" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "radius-7-6" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "radius-go" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "radius-mac-auth" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "radius3" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "remote-syslog" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "siptrunk" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "spa-form-backend" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "test-deploy" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "tracker-crm" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "tracker-crm-uat" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "twilio-webhook" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "vycontrol" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "webnimbus-api" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  },
  "webphone" = {
    tag_prefix_list          = ["latest"]
    scan_on_push             = false
    image_tag_mutability     = "MUTABLE"
    max_untagged_image_count = 20
    max_tagged_image_count   = 100
  }
}