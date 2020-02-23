#!/bin/sh

docker build -t registry.local:5000/base/v1 -f dockerfile/baseDockerfile .
docker push registry.local:5000/base/v1
docker build -t registry.local:5000/redis/v1 -f dockerfile/redisDockerfile .
docker push registry.local:5000/redis/v1
