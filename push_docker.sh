#!/bin/bash
echo Pushing stable
docker push pibara/fsst:stable
docker push pibara/fsst:`python3 git_info_fluree_latest.py | sed -e 's/\r//'`
docker push pibara/fsst:v`python3 -m pip index versions fsst|grep fsst |sed -e 's/.*(//' -e 's/).*//'`-`python3 git_info_fluree_latest.py | sed -e 's/\r//'`
docker push pibara/fsst:v`python3 -m pip index versions fsst|grep fsst |sed -e 's/.*(//' -e 's/).*//'`-stable
echo Pushing v1
docker push pibara/fsst:v1
docker push pibara/fsst:v`python3 -m pip index versions fsst|grep fsst |sed -e 's/.*(//' -e 's/).*//'`-v1
docker push pibara/fsst:`python3 git_info_fluree_latest.py v1| sed -e 's/\r//'`
