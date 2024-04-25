#!/bin/bash
echo "Making latest stable from github"
echo -n STABLE =
python3 git_info_fluree_latest.py
docker build --no-cache -t pibara/fsst:stable . -f Dockerfile-latest-github
docker tag pibara/fsst:stable pibara/fsst:`python3 git_info_fluree_latest.py | sed -e 's/\r//'` 
docker tag pibara/fsst:stable pibara/fsst:v`python3 -m pip index versions fsst|grep fsst |sed -e 's/.*(//' -e 's/).*//'`-`python3 git_info_fluree_latest.py | sed -e 's/\r//'`
docker tag pibara/fsst:stable pibara/fsst:v`python3 -m pip index versions fsst|grep fsst |sed -e 's/.*(//' -e 's/).*//'`-stable
echo "Making latest v1 from github"
echo -n V1 =
python3 git_info_fluree_latest.py v1
docker build --no-cache -t pibara/fsst:v1 . -f Dockerfile-latest-github-v1
docker tag pibara/fsst:v1 pibara/fsst:v`python3 -m pip index versions fsst|grep fsst |sed -e 's/.*(//' -e 's/).*//'`-v1
docker tag pibara/fsst:v1 pibara/fsst:`python3 git_info_fluree_latest.py v1| sed -e 's/\r//'`
docker tag pibara/fsst:v1 pibara/fsst:v`python3 -m pip index versions fsst|grep fsst |sed -e 's/.*(//' -e 's/).*//'`-`python3 git_info_fluree_latest.py v1 | sed -e 's/\r//'`
