#!/usr/bin/env bash

# Add privileges to the repository.
# Create a Team using API and give Write access to the repository.
# Create a Service account using API and give Admin access to the repository.
# Give current user Admin access to the repository.


export NAMESPACE="cloudsmith-org-neeraj" # Replace with your actual namespace
export API_KEY=$CLOUDSMITH_API_KEY # Ensure you have set the CLOUDSMITH_API_KEY environment variable with your API key
export REPO_NAME="assessment-repo" # You can change the repository name as needed
export TEAM_NAME="new-team" # Name for the team to be created

echo "#### Adding privileges to repository: ${REPO_NAME} in namespace: ${NAMESPACE} ####"

curl -sS\
  --request POST \
  --url "https://api.cloudsmith.io/orgs/${NAMESPACE}/teams/" \
  --header 'accept: application/json' \
  --header 'content-type: application/json' \
  --header "X-Api-Key: ${API_KEY}" \
  --data '
{
  "visibility": "Visible",
  "description": "team created using API",
  "name":"'${TEAM_NAME}'"
}
' | jq