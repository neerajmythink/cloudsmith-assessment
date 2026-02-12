#!/usr/bin/env bash

export NAMESPACE="cloudsmith-org-neeraj"
export API_KEY=$CLOUDSMITH_API_KEY

echo "#### Fetching repositories for namespace: ${NAMESPACE} ####"

curl -sS \
  --request GET \
  --url "https://api.cloudsmith.io/v1/repos/${NAMESPACE}/?sort=-created_at" \
  --header 'accept: application/json' \
  --header "X-Api-Key: ${API_KEY}" | jq '.[] | .name'
