#!/bin/bash
echo "Making latest stable using docker hub as source"
python3 dockerhub_make_dockerfile.py 
docker build --no-cache -t pibara/fsst:stable . -f Dockerfile-latest-dockerhub
docker tag pibara/fsst:stable pibara/fsst:`python3 dockerhub_info_fluree_latest.py | sed -e 's/\r//'` 
docker tag pibara/fsst:stable pibara/fsst:v`python3 -m pip index versions fsst|grep fsst |sed -e 's/.*(//' -e 's/).*//'`-`python3 dockerhub_info_fluree_latest.py | sed -e 's/\r//'`
docker tag pibara/fsst:stable pibara/fsst:v`python3 -m pip index versions fsst|grep fsst |sed -e 's/.*(//' -e 's/).*//'`-stable
docker build --no-cache -t pibara/fsst:v1 . -f Dockerfile-v1-dockerhub
docker tag pibara/fsst:v1 pibara/fsst:v`python3 -m pip index versions fsst|grep fsst |sed -e 's/.*(//' -e 's/).*//'`-v1
docker tag pibara/fsst:v1 pibara/fsst:v1.0.5
docker tag pibara/fsst:v1 pibara/fsst:v`python3 -m pip index versions fsst|grep fsst |sed -e 's/.*(//' -e 's/).*//'`-v1.0.5
