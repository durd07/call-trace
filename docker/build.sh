#!/bin/bash

set -e

go build .
cp subscriber-tracing docker/

docker build -f docker/Dockerfile-subscriber-tracing -t durd07/subscriber-tracing:latest docker
docker build -f docker/Dockerfile-mariadb -t durd07/subscriber-tracing-db:latest docker

docker push durd07/subscriber-tracing:latest
docker push durd07/subscriber-tracing-db:latest
