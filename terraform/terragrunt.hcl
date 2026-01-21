# Terragrunt configuration for AWS infrastructure
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<-EOT
    terraform {
      required_providers {
        aws = {
          source  = "hashicorp/aws"
          version = "~> 5.0"
        }
      }
    }

    provider "aws" {
      region = "eu-west-1"

      default_tags {
        tags = {
          RepoName  = "mc-fabric-aoc"
          ManagedBy = "Terraform"
        }
      }
    }
  EOT
}

remote_state {
  backend = "s3"
  config = {
    bucket         = "sjhummerstone-terraform-state"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    use_lockfile   = true
  }
}
