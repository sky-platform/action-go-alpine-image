#!/bin/sh -l

MAIN_DIR_PARH=$1
GITHUB_TOKEN="${GITHUB_TOKEN:-$2}"

apk update
apk add git
[[ ! -z "${GITHUB_TOKEN// }" ]] && git config --global url."https://${GITHUB_TOKEN}@github.com/sky-platform/".insteadOf "https://github.com/sky-platform/"

go mod tidy
go build -o ${MAIN_DIR_PARH}/main ${MAIN_DIR_PARH}/main.go

# docker run -e GITHUB_TOKEN --mount type=bind,source=$(pwd),target=/app go-builder:local api/register/server