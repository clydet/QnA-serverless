#!/bin/bash
DIRECTORY=$(dirname "$0")
IMAGE_NAME=${1:-serverless}
IMAGE_COUNT=$(docker image ls | grep $IMAGE_NAME | wc -l)

if [ "$IMAGE_COUNT" -eq "0" ]; then
  docker build -t $IMAGE_NAME $DIRECTORY
else
  echo "Using existing $IMAGE_NAME image"
fi
