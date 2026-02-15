#!/bin/bash

# Create a new entitlement token in a repository.

NAMESPACE="cloudsmith-org-neeraj"  # Your Cloudsmith namespace
REPO_NAME="example_repo_through_cli"  # The name of the repository you want to update
cloudsmith entitlement create ${NAMESPACE}/${REPO_NAME} --name 'ents_through_cli'