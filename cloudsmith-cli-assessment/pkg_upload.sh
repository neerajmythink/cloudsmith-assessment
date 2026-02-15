#!/bin/bash

# Upload the package to the given repository in given namespace using the Cloudsmith CLI. 
NAMESPACE="cloudsmith-org-neeraj"  # Your Cloudsmith namespace
REPO_NAME="example_repo_through_cli"  # The name of the repository you want to update
PACKAGE_PATH="../python_package/dist/my_tool-0.0.1-py3-none-any.whl"  # Path to your built package
cloudsmith push python ${NAMESPACE}/${REPO_NAME} ${PACKAGE_PATH}