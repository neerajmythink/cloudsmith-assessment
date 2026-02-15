#!/bin/bash

# Create a new upstream for maven central repository using the Cloudsmith CLI.

NAMESPACE="cloudsmith-org-neeraj"  # Your Cloudsmith namespace
REPO_NAME="example_repo_through_cli"  # The name of the repository you want to update
cloudsmith upstream maven create ${NAMESPACE}/${REPO_NAME} repo_create_upstream_config.json