#!/bin/bash

# cloudsmith cli command to add tags to the package in the repository.
NAMESPACE="cloudsmith-org-neeraj"  # Your Cloudsmith namespace 
REPO_NAME="example_repo_through_cli"  # The name of the repository where the package currently exists
PKG_NAME="cloudsmith_python_native_example-100-py2py3-n-4p49" # Change this to the actual package name

cloudsmith tags add ${NAMESPACE}/${REPO_NAME}/${PKG_NAME} first,tag,added