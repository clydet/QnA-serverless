FROM node:16.11-alpine3.12

ARG SERVERLESS_VERSION=latest
ENV SERVERLESS_VERSION $SERVERLESS_VERSION

RUN apk --no-cache add python3 py-pip ca-certificates jq wget git openssh && \
    pip --no-cache-dir install awscli && \
    update-ca-certificates

RUN npm i -g serverless@$SERVERLESS_VERSION

WORKDIR /opt/app