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

# Add upstreams to QA repository for npm and maven
resource "cloudsmith_repository_upstream" "qa_npm" {
  repository    = cloudsmith_repository.qa.slug
  namespace     = var.organization
  name          = "npm-upstream"
  upstream_type = "npm"
  upstream_url  = "https://registry.npmjs.org"
}

resource "cloudsmith_repository_upstream" "qa_maven" {
  repository    = cloudsmith_repository.qa.slug
  namespace     = var.organization
  name          = "maven-upstream"
  upstream_type = "maven"
  upstream_url  = "https://repo.maven.apache.org/maven2"
}

# Add upstream to Staging repository for python
resource "cloudsmith_repository_upstream" "staging_python" {
  repository    = cloudsmith_repository.staging.slug
  namespace     = var.organization
  name          = "python-upstream"
  upstream_type = "python"
  upstream_url  = "https://pypi.org/simple"
}
