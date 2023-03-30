#!/bin/bash
echo "Making latest beta from github"
echo -n BETA =
python3 git_info_fluree_latest.py beta
docker build --no-cache -t pibara/fsst:beta . -f Dockerfile-latest-github-beta
docker tag pibara/fsst:beta pibara/fsst:v`python3 -m pip index versions fsst|grep fsst |sed -e 's/.*(//' -e 's/).*//'`-beta
docker tag pibara/fsst:beta pibara/fsst:`python3 git_info_fluree_latest.py beta| sed -e 's/\r//'` 
docker tag pibara/fsst:beta pibara/fsst:v`python3 -m pip index versions fsst|grep fsst |sed -e 's/.*(//' -e 's/).*//'`-`python3 git_info_fluree_latest.py beta | sed -e 's/\r//'`

