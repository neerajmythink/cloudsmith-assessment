#!/bin/bash

# cloudsmith cli command to list all packages in the given repository and namespace.
NAMESPACE="cloudsmith-org-neeraj"  # Your Cloudsmith namespace
REPO_NAME="example_repo_through_cli"  # The name of the repository you want to update
cloudsmith list packages ${NAMESPACE}/${REPO_NAME}