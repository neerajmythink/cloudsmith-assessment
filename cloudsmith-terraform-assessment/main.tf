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

# Create 3 teams: Dev, DevOps, Admin
resource "cloudsmith_team" "dev" {
  organization = var.organization
  name         = "Dev"
  description  = "Dev team created using Terraform"
}

resource "cloudsmith_team" "devops" {
  organization = var.organization
  name         = "DevOps"
  description  = "DevOps team created using Terraform"
}

resource "cloudsmith_team" "admin" {
  organization = var.organization
  name         = "Admin"
  description  = "Admin team created using Terraform"
}

# Assign the following privileges to repositories:
# QA: Write for all teams
resource "cloudsmith_repository_privileges" "qa_privs" {
  organization = var.organization
  repository   = cloudsmith_repository.qa.slug

  team {
    privilege = "Write"
    slug      = cloudsmith_team.dev.slug
  }

  team {
    privilege = "Write"
    slug      = cloudsmith_team.devops.slug
  }

  team {
    privilege = "Write"
    slug      = cloudsmith_team.admin.slug
  }
}

# Staging: Write for all teams
resource "cloudsmith_repository_privileges" "staging_privs" {
  organization = var.organization
  repository   = cloudsmith_repository.staging.slug

  team {
    privilege = "Write"
    slug      = cloudsmith_team.dev.slug
  }

  team {
    privilege = "Write"
    slug      = cloudsmith_team.devops.slug
  }

  team {
    privilege = "Write"
    slug      = cloudsmith_team.admin.slug
  }
}

# Production: Write for admin, Read for Devops, Dev shouldn’t have permissions
resource "cloudsmith_repository_privileges" "production_privs" {
  organization = var.organization
  repository   = cloudsmith_repository.production.slug

  team {
    privilege = "Write"
    slug      = cloudsmith_team.admin.slug
  }

  team {
    privilege = "Read"
    slug      = cloudsmith_team.devops.slug
  }
}
