#!/bin/bash

set -eu

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
DIR="$ROOT/docker"

NAME="o137/cm"
REVISION="$(date -u +%Y%m%d)"
DOCKERFILE="$DIR/Dockerfile"

echo "Building docker image '$NAME:$REVISION'"

docker image build -t "$NAME:$REVISION" "$DIR" -f "$DOCKERFILE"
docker image tag "$NAME:$REVISION" "$NAME:latest"

read -r -n 1 -p "Do you want to push it to Docker Hub? (y/n) " confirm
echo

if [[ "$confirm" != "y" ]]; then
  echo "Aborting push."
  exit 0
fi

echo "Pushing docker image to Docker Hub"
docker image push "$NAME:$REVISION"
docker image push "$NAME:latest"

echo "Done: $NAME:$REVISION (https://hub.docker.com/r/$NAME)"
