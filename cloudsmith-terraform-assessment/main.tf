terraform {
  required_providers {
    cloudsmith = {
      source  = "cloudsmith-io/cloudsmith"
      version = "0.0.68"
    }
  }
}

provider "cloudsmith" {
  api_key = var.cloudsmith_api_key
}

# Create Cloudsmith repositories
resource "cloudsmith_repository" "qa" {
  name        = "QA"
  namespace   = var.organization
  description = "QA repository created using Terraform"
}

resource "cloudsmith_repository" "staging" {
  name        = "Staging"
  namespace   = var.organization
  description = "Staging repository created using Terraform"
}

resource "cloudsmith_repository" "production" {
  name        = "Production"
  namespace   = var.organization
  description = "Production repository created using Terraform"
}
