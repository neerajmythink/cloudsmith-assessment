#!/usr/bin/env bash
# Load the module
source ./repo_list.sh

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
    "copy_packages": "Read"
            }' | jq '.'
}

# Check if repository with the same name already exists before creating a new one to avoid duplication.
echo "#### Creating repository: '${REPO_NAME}' in namespace: '${NAMESPACE}' ####"
REPOS=$(get_repo_list)

if echo "$REPOS" | grep -q ${REPO_NAME}; then
    echo "Repository '${REPO_NAME}' already exists in namespace '${NAMESPACE}'. Try different name to avoid duplication."
    exit 0
else
    echo "Repository not found with same name. Creating repository '${REPO_NAME}' in namespace '${NAMESPACE}'."
    create_repo
    echo "Repository '${REPO_NAME}' created successfully in namespace '${NAMESPACE}'."
fi