#!/usr/bin/env bash

set -euo pipefail

IMAGE_NAME="flask-cicd-project"
CONTAINER_NAME="flask-cicd-project"

docker build -t "$IMAGE_NAME" .
docker rm -f "$CONTAINER_NAME" >/dev/null 2>&1 || true
docker run -d --name "$CONTAINER_NAME" -p 5000:5000 "$IMAGE_NAME"