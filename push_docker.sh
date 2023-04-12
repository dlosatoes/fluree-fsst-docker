#!/bin/bash
echo Pushing stable-broken
docker push pibara/fsst:stable-broken
echo Pushing v1
docker push pibara/fsst:v1
docker push pibara/fsst:v`python3 -m pip index versions fsst|grep fsst |sed -e 's/.*(//' -e 's/).*//'`-v1
docker push pibara/fsst:`python3 git_info_fluree_latest.py v1| sed -e 's/\r//'`
