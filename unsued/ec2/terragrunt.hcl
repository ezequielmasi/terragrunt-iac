include "root" {
  path = find_in_parent_folders("terragrunt.hcl")
}

terraform {}

dependency "vpc" {
  config_path = "../vpc"
}

inputs = {
  vpc_id = dependency.vpc.outputs.vpc_id

  ec2_instances = {
    sa-migrator-1 = {
      name                        = "sa-migrator-1"
      ami                         = "ami-0eb9d67c52f5c80e5"
      instance_type               = "t3.micro"
      subnet_id                   = "subnet-057aa3e3cae23ef15"
      associate_public_ip_address = false
      custom_policy_path          = "custom-policies/sa-migrator.json"
      user_data_path              = "user-data/sa-migrator.sh"
      user_data_replace_on_change = false
      disable_api_termination     = false
      monitoring                  = true

      root_block_device = [
        {
          encrypted   = true
          throughput  = 125
          volume_size = 30
          volume_type = "gp3"
        }
      ]

      ingress_security_groups = [
        {
          description = "All ports"
          from_port   = 0
          to_port     = 0
          protocol    = "all"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]

      egress_security_groups = [
        {
          description = "All ports"
          from_port   = 0
          to_port     = 0
          protocol    = "all"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]

      metadata_options = {
        http_tokens = "required"
      }

      tags = {}
    }

    sa-migrator-2 = {
      name                        = "sa-migrator-2"
      ami                         = "ami-0eb9d67c52f5c80e5"
      instance_type               = "t3.micro"
      subnet_id                   = "subnet-057aa3e3cae23ef15"
      associate_public_ip_address = false
      custom_policy_path          = "custom-policies/sa-migrator.json"
      user_data_path              = "user-data/sa-migrator.sh"
      user_data_replace_on_change = false
      disable_api_termination     = false
      monitoring                  = true

      root_block_device = [
        {
          encrypted   = true
          throughput  = 125
          volume_size = 30
          volume_type = "gp3"
        }
      ]

      ingress_security_groups = [
        {
          description = "All ports"
          from_port   = 0
          to_port     = 0
          protocol    = "all"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]

      egress_security_groups = [
        {
          description = "All ports"
          from_port   = 0
          to_port     = 0
          protocol    = "all"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]

      metadata_options = {
        http_tokens = "required"
      }

      tags = {}
    }

    sa-migrator-3 = {
      name                        = "sa-migrator-3"
      ami                         = "ami-0eb9d67c52f5c80e5"
      instance_type               = "t3.micro"
      subnet_id                   = "subnet-057aa3e3cae23ef15"
      associate_public_ip_address = false
      custom_policy_path          = "custom-policies/sa-migrator.json"
      user_data_path              = "user-data/sa-migrator.sh"
      user_data_replace_on_change = false
      disable_api_termination     = false
      monitoring                  = true

      root_block_device = [
        {
          encrypted   = true
          throughput  = 125
          volume_size = 30
          volume_type = "gp3"
        }
      ]

      ingress_security_groups = [
        {
          description = "All ports"
          from_port   = 0
          to_port     = 0
          protocol    = "all"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]

      egress_security_groups = [
        {
          description = "All ports"
          from_port   = 0
          to_port     = 0
          protocol    = "all"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]

      metadata_options = {
        http_tokens = "required"
      }

      tags = {}
    }

    sa-migrator-4 = {
      name                        = "sa-migrator-4"
      ami                         = "ami-0eb9d67c52f5c80e5"
      instance_type               = "t3.micro"
      subnet_id                   = "subnet-057aa3e3cae23ef15"
      associate_public_ip_address = false
      custom_policy_path          = "custom-policies/sa-migrator.json"
      user_data_path              = "user-data/sa-migrator.sh"
      user_data_replace_on_change = false
      disable_api_termination     = false
      monitoring                  = true

      root_block_device = [
        {
          encrypted   = true
          throughput  = 125
          volume_size = 30
          volume_type = "gp3"
        }
      ]

      ingress_security_groups = [
        {
          description = "All ports"
          from_port   = 0
          to_port     = 0
          protocol    = "all"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]

      egress_security_groups = [
        {
          description = "All ports"
          from_port   = 0
          to_port     = 0
          protocol    = "all"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]

      metadata_options = {
        http_tokens = "required"
      }

      tags = {}
    }

    sa-migrator-5 = {
      name                        = "sa-migrator-5"
      ami                         = "ami-0eb9d67c52f5c80e5"
      instance_type               = "t3.micro"
      subnet_id                   = "subnet-057aa3e3cae23ef15"
      associate_public_ip_address = false
      custom_policy_path          = "custom-policies/sa-migrator.json"
      user_data_path              = "user-data/sa-migrator.sh"
      user_data_replace_on_change = false
      disable_api_termination     = false
      monitoring                  = true

      root_block_device = [
        {
          encrypted   = true
          throughput  = 125
          volume_size = 30
          volume_type = "gp3"
        }
      ]

      ingress_security_groups = [
        {
          description = "All ports"
          from_port   = 0
          to_port     = 0
          protocol    = "all"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]

      egress_security_groups = [
        {
          description = "All ports"
          from_port   = 0
          to_port     = 0
          protocol    = "all"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]

      metadata_options = {
        http_tokens = "required"
      }

      tags = {}
    }

    sa-migrator-6 = {
      name                        = "sa-migrator-6"
      ami                         = "ami-0eb9d67c52f5c80e5"
      instance_type               = "t3.micro"
      subnet_id                   = "subnet-057aa3e3cae23ef15"
      associate_public_ip_address = false
      custom_policy_path          = "custom-policies/sa-migrator.json"
      user_data_path              = "user-data/sa-migrator.sh"
      user_data_replace_on_change = false
      disable_api_termination     = false
      monitoring                  = true

      root_block_device = [
        {
          encrypted   = true
          throughput  = 125
          volume_size = 30
          volume_type = "gp3"
        }
      ]

      ingress_security_groups = [
        {
          description = "All ports"
          from_port   = 0
          to_port     = 0
          protocol    = "all"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]

      egress_security_groups = [
        {
          description = "All ports"
          from_port   = 0
          to_port     = 0
          protocol    = "all"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]

      metadata_options = {
        http_tokens = "required"
      }

      tags = {}
    }

    sa-migrator-7 = {
      name                        = "sa-migrator-7"
      ami                         = "ami-0eb9d67c52f5c80e5"
      instance_type               = "t3.micro"
      subnet_id                   = "subnet-057aa3e3cae23ef15"
      associate_public_ip_address = false
      custom_policy_path          = "custom-policies/sa-migrator.json"
      user_data_path              = "user-data/sa-migrator.sh"
      user_data_replace_on_change = false
      disable_api_termination     = false
      monitoring                  = true

      root_block_device = [
        {
          encrypted   = true
          throughput  = 125
          volume_size = 30
          volume_type = "gp3"
        }
      ]

      ingress_security_groups = [
        {
          description = "All ports"
          from_port   = 0
          to_port     = 0
          protocol    = "all"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]

      egress_security_groups = [
        {
          description = "All ports"
          from_port   = 0
          to_port     = 0
          protocol    = "all"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]

      metadata_options = {
        http_tokens = "required"
      }

      tags = {}
    }

    sa-migrator-8 = {
      name                        = "sa-migrator-8"
      ami                         = "ami-0eb9d67c52f5c80e5"
      instance_type               = "t3.micro"
      subnet_id                   = "subnet-057aa3e3cae23ef15"
      associate_public_ip_address = false
      custom_policy_path          = "custom-policies/sa-migrator.json"
      user_data_path              = "user-data/sa-migrator.sh"
      user_data_replace_on_change = false
      disable_api_termination     = false
      monitoring                  = true

      root_block_device = [
        {
          encrypted   = true
          throughput  = 125
          volume_size = 30
          volume_type = "gp3"
        }
      ]

      ingress_security_groups = [
        {
          description = "All ports"
          from_port   = 0
          to_port     = 0
          protocol    = "all"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]

      egress_security_groups = [
        {
          description = "All ports"
          from_port   = 0
          to_port     = 0
          protocol    = "all"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]

      metadata_options = {
        http_tokens = "required"
      }

      tags = {}
    }

    sa-migrator-uploads-1 = {
      name                        = "sa-migrator-uploads-1"
      ami                         = "ami-0eb9d67c52f5c80e5"
      instance_type               = "t3.small"
      subnet_id                   = "subnet-057aa3e3cae23ef15"
      associate_public_ip_address = false
      custom_policy_path          = "custom-policies/sa-migrator.json"
      user_data_path              = "user-data/sa-migrator.sh"
      user_data_replace_on_change = false
      disable_api_termination     = false
      monitoring                  = true

      root_block_device = [
        {
          encrypted   = true
          throughput  = 125
          volume_size = 30
          volume_type = "gp3"
        }
      ]

      ingress_security_groups = [
        {
          description = "All ports"
          from_port   = 0
          to_port     = 0
          protocol    = "all"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]

      egress_security_groups = [
        {
          description = "All ports"
          from_port   = 0
          to_port     = 0
          protocol    = "all"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]

      metadata_options = {
        http_tokens = "required"
      }

      tags = {}
    }

    sa-migrator-uploads-2 = {
      name                        = "sa-migrator-uploads-2"
      ami                         = "ami-0eb9d67c52f5c80e5"
      instance_type               = "t3.large"
      subnet_id                   = "subnet-057aa3e3cae23ef15"
      associate_public_ip_address = false
      custom_policy_path          = "custom-policies/sa-migrator.json"
      user_data_path              = "user-data/sa-migrator.sh"
      user_data_replace_on_change = false
      disable_api_termination     = false
      monitoring                  = true

      root_block_device = [
        {
          encrypted   = true
          throughput  = 125
          volume_size = 30
          volume_type = "gp3"
        }
      ]

      ingress_security_groups = [
        {
          description = "All ports"
          from_port   = 0
          to_port     = 0
          protocol    = "all"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]

      egress_security_groups = [
        {
          description = "All ports"
          from_port   = 0
          to_port     = 0
          protocol    = "all"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]

      metadata_options = {
        http_tokens = "required"
      }

      tags = {}
    }

    sa-migrator-uploads-3 = {
      name                        = "sa-migrator-uploads-3"
      ami                         = "ami-0eb9d67c52f5c80e5"
      instance_type               = "t3.micro"
      subnet_id                   = "subnet-057aa3e3cae23ef15"
      associate_public_ip_address = false
      custom_policy_path          = "custom-policies/sa-migrator.json"
      user_data_path              = "user-data/sa-migrator.sh"
      user_data_replace_on_change = false
      disable_api_termination     = false
      monitoring                  = true

      root_block_device = [
        {
          encrypted   = true
          throughput  = 125
          volume_size = 30
          volume_type = "gp3"
        }
      ]

      ingress_security_groups = [
        {
          description = "All ports"
          from_port   = 0
          to_port     = 0
          protocol    = "all"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]

      egress_security_groups = [
        {
          description = "All ports"
          from_port   = 0
          to_port     = 0
          protocol    = "all"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]

      metadata_options = {
        http_tokens = "required"
      }

      tags = {}
    }

    sa-migrator-uploads-4 = {
      name                        = "sa-migrator-uploads-4"
      ami                         = "ami-0eb9d67c52f5c80e5"
      instance_type               = "t3.small"
      subnet_id                   = "subnet-057aa3e3cae23ef15"
      associate_public_ip_address = false
      custom_policy_path          = "custom-policies/sa-migrator.json"
      user_data_path              = "user-data/sa-migrator.sh"
      user_data_replace_on_change = false
      disable_api_termination     = false
      monitoring                  = true

      root_block_device = [
        {
          encrypted   = true
          throughput  = 125
          volume_size = 30
          volume_type = "gp3"
        }
      ]

      ingress_security_groups = [
        {
          description = "All ports"
          from_port   = 0
          to_port     = 0
          protocol    = "all"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]

      egress_security_groups = [
        {
          description = "All ports"
          from_port   = 0
          to_port     = 0
          protocol    = "all"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]

      metadata_options = {
        http_tokens = "required"
      }

      tags = {}
    }

    sa-migrator-uploads-5 = {
      name                        = "sa-migrator-uploads-5"
      ami                         = "ami-0eb9d67c52f5c80e5"
      instance_type               = "t3.micro"
      subnet_id                   = "subnet-057aa3e3cae23ef15"
      associate_public_ip_address = false
      custom_policy_path          = "custom-policies/sa-migrator.json"
      user_data_path              = "user-data/sa-migrator.sh"
      user_data_replace_on_change = false
      disable_api_termination     = false
      monitoring                  = true

      root_block_device = [
        {
          encrypted   = true
          throughput  = 125
          volume_size = 30
          volume_type = "gp3"
        }
      ]

      ingress_security_groups = [
        {
          description = "All ports"
          from_port   = 0
          to_port     = 0
          protocol    = "all"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]

      egress_security_groups = [
        {
          description = "All ports"
          from_port   = 0
          to_port     = 0
          protocol    = "all"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]

      metadata_options = {
        http_tokens = "required"
      }

      tags = {}
    }

    sa-migrator-uploads-6 = {
      name                        = "sa-migrator-uploads-6"
      ami                         = "ami-0eb9d67c52f5c80e5"
      instance_type               = "t3.medium"
      subnet_id                   = "subnet-057aa3e3cae23ef15"
      associate_public_ip_address = false
      custom_policy_path          = "custom-policies/sa-migrator.json"
      user_data_path              = "user-data/sa-migrator.sh"
      user_data_replace_on_change = false
      disable_api_termination     = false
      monitoring                  = true

      root_block_device = [
        {
          encrypted   = true
          throughput  = 125
          volume_size = 30
          volume_type = "gp3"
        }
      ]

      ingress_security_groups = [
        {
          description = "All ports"
          from_port   = 0
          to_port     = 0
          protocol    = "all"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]

      egress_security_groups = [
        {
          description = "All ports"
          from_port   = 0
          to_port     = 0
          protocol    = "all"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]

      metadata_options = {
        http_tokens = "required"
      }

      tags = {}
    }

    sa-migrator-uploads-7 = {
      name                        = "sa-migrator-uploads-7"
      ami                         = "ami-0eb9d67c52f5c80e5"
      instance_type               = "t3.micro"
      subnet_id                   = "subnet-057aa3e3cae23ef15"
      associate_public_ip_address = false
      custom_policy_path          = "custom-policies/sa-migrator.json"
      user_data_path              = "user-data/sa-migrator.sh"
      user_data_replace_on_change = false
      disable_api_termination     = false
      monitoring                  = true

      root_block_device = [
        {
          encrypted   = true
          throughput  = 125
          volume_size = 30
          volume_type = "gp3"
        }
      ]

      ingress_security_groups = [
        {
          description = "All ports"
          from_port   = 0
          to_port     = 0
          protocol    = "all"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]

      egress_security_groups = [
        {
          description = "All ports"
          from_port   = 0
          to_port     = 0
          protocol    = "all"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]

      metadata_options = {
        http_tokens = "required"
      }

      tags = {}
    }

    sa-migrator-uploads-8 = {
      name                        = "sa-migrator-uploads-8"
      ami                         = "ami-0eb9d67c52f5c80e5"
      instance_type               = "t3.micro"
      subnet_id                   = "subnet-057aa3e3cae23ef15"
      associate_public_ip_address = false
      custom_policy_path          = "custom-policies/sa-migrator.json"
      user_data_path              = "user-data/sa-migrator.sh"
      user_data_replace_on_change = false
      disable_api_termination     = false
      monitoring                  = true

      root_block_device = [
        {
          encrypted   = true
          throughput  = 125
          volume_size = 30
          volume_type = "gp3"
        }
      ]

      ingress_security_groups = [
        {
          description = "All ports"
          from_port   = 0
          to_port     = 0
          protocol    = "all"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]

      egress_security_groups = [
        {
          description = "All ports"
          from_port   = 0
          to_port     = 0
          protocol    = "all"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]

      metadata_options = {
        http_tokens = "required"
      }

      tags = {}
    }

    sa-migrator-uploads-9 = {
      name                        = "sa-migrator-uploads-9"
      ami                         = "ami-0eb9d67c52f5c80e5"
      instance_type               = "t3.small"
      subnet_id                   = "subnet-057aa3e3cae23ef15"
      associate_public_ip_address = false
      custom_policy_path          = "custom-policies/sa-migrator.json"
      user_data_path              = "user-data/sa-migrator.sh"
      user_data_replace_on_change = false
      disable_api_termination     = false
      monitoring                  = true

      root_block_device = [
        {
          encrypted   = true
          throughput  = 125
          volume_size = 30
          volume_type = "gp3"
        }
      ]

      ingress_security_groups = [
        {
          description = "All ports"
          from_port   = 0
          to_port     = 0
          protocol    = "all"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]

      egress_security_groups = [
        {
          description = "All ports"
          from_port   = 0
          to_port     = 0
          protocol    = "all"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]

      metadata_options = {
        http_tokens = "required"
      }

      tags = {}
    }

    sa-migrator-uploads-10 = {
      name                        = "sa-migrator-uploads-10"
      ami                         = "ami-0eb9d67c52f5c80e5"
      instance_type               = "t3.micro"
      subnet_id                   = "subnet-057aa3e3cae23ef15"
      associate_public_ip_address = false
      custom_policy_path          = "custom-policies/sa-migrator.json"
      user_data_path              = "user-data/sa-migrator.sh"
      user_data_replace_on_change = false
      disable_api_termination     = false
      monitoring                  = true

      root_block_device = [
        {
          encrypted   = true
          throughput  = 125
          volume_size = 30
          volume_type = "gp3"
        }
      ]

      ingress_security_groups = [
        {
          description = "All ports"
          from_port   = 0
          to_port     = 0
          protocol    = "all"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]

      egress_security_groups = [
        {
          description = "All ports"
          from_port   = 0
          to_port     = 0
          protocol    = "all"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]

      metadata_options = {
        http_tokens = "required"
      }

      tags = {}
    }

    sa-migrator-uploads-11 = {
      name                        = "sa-migrator-uploads-11"
      ami                         = "ami-0eb9d67c52f5c80e5"
      instance_type               = "t3.xlarge"
      subnet_id                   = "subnet-057aa3e3cae23ef15"
      associate_public_ip_address = false
      custom_policy_path          = "custom-policies/sa-migrator.json"
      user_data_path              = "user-data/sa-migrator.sh"
      user_data_replace_on_change = false
      disable_api_termination     = false
      monitoring                  = true

      root_block_device = [
        {
          encrypted   = true
          throughput  = 125
          volume_size = 30
          volume_type = "gp3"
        }
      ]

      ingress_security_groups = [
        {
          description = "All ports"
          from_port   = 0
          to_port     = 0
          protocol    = "all"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]

      egress_security_groups = [
        {
          description = "All ports"
          from_port   = 0
          to_port     = 0
          protocol    = "all"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]

      metadata_options = {
        http_tokens = "required"
      }

      tags = {}
    }

    sa-migrator-uploads-12 = {
      name                        = "sa-migrator-uploads-12"
      ami                         = "ami-0eb9d67c52f5c80e5"
      instance_type               = "t3.micro"
      subnet_id                   = "subnet-057aa3e3cae23ef15"
      associate_public_ip_address = false
      custom_policy_path          = "custom-policies/sa-migrator.json"
      user_data_path              = "user-data/sa-migrator.sh"
      user_data_replace_on_change = false
      disable_api_termination     = false
      monitoring                  = true

      root_block_device = [
        {
          encrypted   = true
          throughput  = 125
          volume_size = 30
          volume_type = "gp3"
        }
      ]

      ingress_security_groups = [
        {
          description = "All ports"
          from_port   = 0
          to_port     = 0
          protocol    = "all"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]

      egress_security_groups = [
        {
          description = "All ports"
          from_port   = 0
          to_port     = 0
          protocol    = "all"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]

      metadata_options = {
        http_tokens = "required"
      }

      tags = {}
    }
  }
}
