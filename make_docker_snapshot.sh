#!/bin/bash
echo "Making docker with current snapshot from github"
echo -n SNAPSHOT =
date --iso
docker build --no-cache -t pibara/fsst:snapshot . -f Dockerfile-snapshot
docker tag pibara/fsst:stable pibara/fsst:snapshot-`date --iso` 
