#!/bin/bash
echo Pushing stable
docker push fluree/fsst:stable
docker push fluree/fsst:`python3 git_info_fluree_latest.py | sed -e 's/\r//'`
docker push fluree/fsst:v`python3 -m pip index versions fsst|grep fsst |sed -e 's/.*(//' -e 's/).*//'`-`python3 dockerhub_info_fluree_latest.py | sed -e 's/\r//'`
docker push fluree/fsst:v`python3 -m pip index versions fsst|grep fsst |sed -e 's/.*(//' -e 's/).*//'`-stable
