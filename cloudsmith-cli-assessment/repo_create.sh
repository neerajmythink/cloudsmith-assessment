#!/bin/bash

# Create a Cloudsmith repository using the CLI

NAMESPACE="cloudsmith-org-neeraj"  # Your Cloudsmith namespace

# Execute repository creation with the specified configuration
cloudsmith repos create ${NAMESPACE} repo_create_config.json
