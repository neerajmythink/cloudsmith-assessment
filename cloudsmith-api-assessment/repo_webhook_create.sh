#!/usr/bin/env bash

# Creating a webhook in the repository that Trigger on package.synced & package.tags_updated for only npm packages in the repository.
export NAMESPACE="cloudsmith-org-neeraj" # Replace with your actual namespace
export API_KEY=$CLOUDSMITH_API_KEY # Ensure you have set the CLOUDSMITH_API_KEY environment variable with your API key
export REPO_NAME="assessment-repo" # You can change the repository name as needed

# Function to set up a webhook for npm packages
create_webhook() {
  curl -sS\
    --request POST \
    --url https://api.cloudsmith.io/webhooks/${NAMESPACE}/${REPO_NAME}/ \
    --header "X-Api-Key: ${API_KEY}" \
    --header 'accept: application/json' \
    --header 'content-type: application/json' \
    --data '
          {
        "is_active": true,
        "target_url": "https://api.github.com/repos/neerajmythink/cloudsmith-cs-interview-candidate/dispatchess",
        "request_body_format": 3,
        "request_body_template_format": 1,
        "secret_header": "Authorization",
        "verify_ssl": true,
        "templates": [
                      {
                        "event": "default",
                        "template": "{\"event_type\": \"cloudsmith_package_uploaded\"}"
                      }
                      ],
        "events": [
                  "package.synced",
                  "package.tags_updated"
                ]
      }
' | jq '.slug_perm'
}

echo "#### Creating a webhook for npm packages in '${REPO_NAME}' in namespace: '${NAMESPACE}' with 'slug_perm' as ####"
create_webhook