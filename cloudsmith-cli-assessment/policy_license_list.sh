#!/bin/bash

# cloudsmith cli command to Create a new Licence Policy. Document the steps and configurations you chose.

NAMESPACE="cloudsmith-org-neeraj"  # Your Cloudsmith namespace 
cloudsmith policy license list ${NAMESPACE} > policy_license_list_output.txt