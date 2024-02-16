#!/bin/bash -xe
# Example to run:
#   AWS_ACCESS_KEY_ID=XXXX AWS_SECRET_ACCESS_KEY=YYYY ./deploy.sh

declare -a environments=("nau-dev-shared" "nau-stage-shared" "nau-prod-shared")

for environment in "${environments[@]}"
do
  AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} s3cmd --host rgw.nau.fccn.pt --host-bucket $environment put maintenance-site/index.html s3://$environment/maintenance-site/index.html --acl-public
done
