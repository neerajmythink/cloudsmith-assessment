#!/usr/bin/env bash

export NAMESPACE="cloudsmith-org-neeraj" # Replace with your actual namespace
export API_KEY=$CLOUDSMITH_API_KEY       # Ensure you have set the CLOUDSMITH_API_KEY environment variable with your API key
export REPO_NAME="assessment-repo"       # You can change the repository name as needed
export REPO_DESC="This is a test repository created using cloudsmith API"

# function to create a repository
create_repo() {
  curl -sS\
    --request POST \
    --url "https://api.cloudsmith.io/repos/${NAMESPACE}/" \
    --header 'accept: application/json' \
    --header 'content-type: application/json' \
    --header "X-Api-Key: ${API_KEY}" \
    --data '{
    "name": "'"${REPO_NAME}"'",
    "description": "'"${REPO_DESC}"'",
    "repository_type_str": "Public",
    "default_privilege": "Read"
    }' | jq '.'
}

# Create a new repository
echo "#### Creating a new repository: '${REPO_NAME}' in namespace: '${NAMESPACE}' ####"
create_repo