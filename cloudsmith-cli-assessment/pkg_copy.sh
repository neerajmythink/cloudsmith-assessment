#!/bin/bash

# cloudsmith cli command to copy the package to another repository in the same namespace.
NAMESPACE="cloudsmith-org-neeraj"  # Your Cloudsmith namespace
REPO_NAME="example_repo_through_cli"  # The name of the repository where the package currently exists
TARGET_REPO_NAME="assessment-repo"  # The name of the target repository where you want to copy the package
PKG_NAME="cloudsmith_python_native_example-100-py2py3-n-4p49" # Change this to the actual package name you want to copy

cloudsmith copy ${NAMESPACE}/${REPO_NAME}/${PKG_NAME} ${TARGET_REPO_NAME}