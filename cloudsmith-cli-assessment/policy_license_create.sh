#!/bin/bash

# cloudsmith cli command to Create a new Licence Policy. Document the steps and configurations you chose.

NAMESPACE="cloudsmith-org-neeraj"  # Your Cloudsmith namespace 
REPO_NAME="example_repo_through_cli"  # The name of the repository where the package currently exists

cloudsmith policy license create ${NAMESPACE} policy_license_create.json