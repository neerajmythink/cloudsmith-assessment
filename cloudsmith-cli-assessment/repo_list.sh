#!/bin/bash

# List all repositories in your organisation and capture the output in a text file.

NAMESPACE="cloudsmith-org-neeraj"  # Your Cloudsmith namespace
cloudsmith repos list ${NAMESPACE} > repo_list_output.txt