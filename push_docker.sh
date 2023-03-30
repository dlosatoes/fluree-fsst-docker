#!/bin/bash
echo Pushing stable
docker push pibara/fsst:stable
docker push pibara/fsst:v`python3 git_info_fluree_latest.py | sed -e 's/\r//'`
docker push pibara/fsst:v`python3 -m pip index versions fsst|grep fsst |sed -e 's/.*(//' -e 's/).*//'`-stable
docker push pibara/fsst:v`python3 -m pip index versions fsst|grep fsst |sed -e 's/.*(//' -e 's/).*//'`-`python3 git_info_fluree_latest.py | sed -e 's/\r//'`
echo Pushing beta
docker push pibara/fsst:beta
docker push pibara/fsst:v`python3 -m pip index versions fsst|grep fsst |sed -e 's/.*(//' -e 's/).*//'`-beta
docker push pibara/fsst:`python3 git_info_fluree_latest.py beta| sed -e 's/\r//'`
docker push pibara/fsst:v`python3 -m pip index versions fsst|grep fsst |sed -e 's/.*(//' -e 's/).*//'`-`python3 git_info_fluree_latest.py beta| sed -e 's/\r//'`
