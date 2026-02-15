#!/bin/bash

# Update a repository description and Repo type from Public to Private.

NAMESPACE="cloudsmith-org-neeraj"  # Your Cloudsmith namespace
REPO_NAME="example_repo_through_cli"  # The name of the repository you want to update
cloudsmith repos update ${NAMESPACE}/${REPO_NAME} repo_update_config.json
