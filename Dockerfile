# Container image that runs your code
FROM golang:1.20-alpine3.17

ENV GOPRIVATE=github.com/sky-platform

WORKDIR /app
# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
