#!/bin/bash
echo Pushing stable
docker push dlosatoes/fsst:stable
docker push dlosatoes/fsst:`python3 git_info_fluree_latest.py | sed -e 's/\r//'`
docker push dlosatoes/fsst:v`python3 -m pip index versions fsst|grep fsst |sed -e 's/.*(//' -e 's/).*//'`-`python3 dockerhub_info_fluree_latest.py | sed -e 's/\r//'`
docker push dlosatoes/fsst:v`python3 -m pip index versions fsst|grep fsst |sed -e 's/.*(//' -e 's/).*//'`-stable
echo Pushing v1
docker push dlosatoes/fsst:v1
docker push dlosatoes/fsst:v`python3 -m pip index versions fsst|grep fsst |sed -e 's/.*(//' -e 's/).*//'`-v1
