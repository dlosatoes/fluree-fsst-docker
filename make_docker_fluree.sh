#!/bin/bash
echo "Making latest stable using docker hub as source"
python3 dockerhub_make_dockerfile.py 
docker build --no-cache -t fluree/fsst:stable . -f Dockerfile-latest-dockerhub
docker tag fluree/fsst:stable fluree/fsst:`python3 dockerhub_info_fluree_latest.py | sed -e 's/\r//'` 
docker tag fluree/fsst:stable fluree/fsst:v`python3 -m pip index versions fsst|grep fsst |sed -e 's/.*(//' -e 's/).*//'`-`python3 dockerhub_info_fluree_latest.py | sed -e 's/\r//'`
docker tag fluree/fsst:stable fluree/fsst:v`python3 -m pip index versions fsst|grep fsst |sed -e 's/.*(//' -e 's/).*//'`-stable
