#!/bin/bash
DIRECTORY=$(dirname "$0")
IMAGE_NAME=${1:-serverless}
AWS_ENV_VARIABLES=""
WORK_DIRECTORY=$(cd $DIRECTORY/.. && pwd)

$DIRECTORY/container-build.sh $IMAGE_NAME

for AWS_ENV in $(env | grep AWS); do
  AWS_ENV_VARIABLES="$AWS_ENV_VARIABLES --env $AWS_ENV"
done

docker run \
  -v ~/.aws/credentials:/root/.aws/credentials:ro \
  -v $WORK_DIRECTORY:/opt/app \
  --env PS1="\e[1;44m\u@$IMAGE_NAME:\W \$\e[m " \
  $AWS_ENV_VARIABLES \
  -it serverless /bin/sh
  