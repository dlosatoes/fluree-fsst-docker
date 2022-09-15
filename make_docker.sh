#!/bin/bash
echo "Making latest beta/stable from github"
echo -n BETA =
python3 git_info_fluree_latest.py
docker build --no-cache -t pibara/fsst:beta . -f Dockerfile-latest-github
docker tag pibara/fsst:beta pibara/fsst:v`python3 -m pip index versions fsst|grep fsst |sed -e 's/.*(//' -e 's/).*//'`-beta
docker tag pibara/fsst:beta pibara/fsst:`python3 git_info_fluree_latest.py | sed -e 's/\r//'` 
docker tag pibara/fsst:beta pibara/fsst:v`python3 -m pip index versions fsst|grep fsst |sed -e 's/.*(//' -e 's/).*//'`-`python3 git_info_fluree_latest.py | sed -e 's/\r//'`
docker tag pibara/fsst:beta pibara/fsst:stable
docker tag pibara/fsst:beta pibara/fsst:v`python3 -m pip index versions fsst|grep fsst |sed -e 's/.*(//' -e 's/).*//'`-stable

