#!/bin/bash
echo "Making latest stable from github"
echo -n STABLE =
python3 git_info_fluree_latest.py
docker build --no-cache -t pibara/fsst:stable . -f Dockerfile-latest-github
docker tag pibara/fsst:stable pibara/fsst:`python3 git_info_fluree_latest.py | sed -e 's/\r//'` 
docker tag pibara/fsst:stable pibara/fsst:v`python3 -m pip index versions fsst|grep fsst |sed -e 's/.*(//' -e 's/).*//'`-`python3 git_info_fluree_latest.py | sed -e 's/\r//'`
docker tag pibara/fsst:stable pibara/fsst:v`python3 -m pip index versions fsst|grep fsst |sed -e 's/.*(//' -e 's/).*//'`-stable

