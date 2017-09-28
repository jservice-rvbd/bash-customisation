#!/usr/bin/env bash

# Remove stopped docker containers and dangling images
docker-cleanup() {
    docker rm $(docker ps -a -q -f 'status=created' -f 'status=exited')
    docker rmi $(docker images -f 'dangling=true' -q)
}
