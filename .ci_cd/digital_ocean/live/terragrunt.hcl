
generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  backend "s3" {
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    endpoint                    = "https://nyc3.digitaloceanspaces.com"
    region                      = "us-east-1" // needed
    bucket                      = "openremote-terraform-states"
    key                         = "${path_relative_to_include()}/terraform.tfstate"
  }
}
EOF
}
