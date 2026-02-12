#!/usr/bin/env bash

export NAMESPACE="cloudsmith-org-neeraj" # Replace with your actual namespace
export API_KEY=$CLOUDSMITH_API_KEY # Ensure you have set the CLOUDSMITH_API_KEY environment variable with your API key

echo "#### Fetching repositories for namespace: ${NAMESPACE} ####"

curl -sS \
  --request GET \
  --url "https://api.cloudsmith.io/v1/repos/${NAMESPACE}/?sort=-created_at" \
  --header 'accept: application/json' \
  --header "X-Api-Key: ${API_KEY}" | jq '.[] | .name'
