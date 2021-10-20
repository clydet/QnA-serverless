#!/bin/bash
DIRECTORY=$(dirname "$0")
IMAGE_NAME=${1:-serverless}
TAG_NAME=${2:-latest}
ACCOUNT=$(aws sts get-caller-identity --query 'Account' --output text)

$DIRECTORY/container-build.sh $IMAGE_NAME
docker tag $IMAGE_NAME ${ACCOUNT}.dkr.ecr.us-east-1.amazonaws.com/$IMAGE_NAME:latest

echo $(aws ecr get-login-password) \
| docker login --username AWS --password-stdin $ACCOUNT.dkr.ecr.us-east-1.amazonaws.com

docker image push --all-tags $ACCOUNT.dkr.ecr.us-east-1.amazonaws.com/$IMAGE_NAME