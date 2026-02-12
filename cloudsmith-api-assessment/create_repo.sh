#!/usr/bin/env bash

# Create a new repository in a given namespace using cloudsmith API
# Add a Name & Description.
# Repository Type - Public
# Default Privilege - Read.
# Record the request & response.

export NAMESPACE="cloudsmith-org-neeraj" // Replace with your actual namespace
export API_KEY=$CLOUDSMITH_API_KEY       // Ensure you have set the CLOUDSMITH_API_KEY environment variable with your API key
export REPO_NAME="assessment-repo"       // You can change the repository name as needed
export REPO_DESC="This is a test repository created using cloudsmith API"
export LOG_FILE="request_response.log"

curl --request POST \
  --url "https://api.cloudsmith.io/repos/${NAMESPACE}/" \
  --header 'accept: application/json' \
  --header 'content-type: application/json' \
  --header "X-Api-Key: ${API_KEY}" \
  --data '{
  "name": "'"${REPO_NAME}"'",
  "description": "'"${REPO_DESC}"'",
  "repository_type_str": "Public",
  "copy_packages": "Read"
}' \
  -w "\n=== Response Status: %{http_code} ===\n" \
  -v > "${LOG_FILE}" 2>&1

echo "Request and response logged to ${LOG_FILE}"