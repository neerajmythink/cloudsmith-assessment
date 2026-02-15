#!/bin/bash

# cloudsmith cli command to Create a new Licence Policy.

NAMESPACE="cloudsmith-org-neeraj"  # Your Cloudsmith namespace 
cloudsmith policy license create ${NAMESPACE} policy_license_config.json