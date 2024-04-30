#!/bin/bash
#echo "Making using older docker hub releases as source"
docker build --no-cache -t dlosatoes/fsst:fluree-v2.0.3 . -f Dockerfile-2.0.3
docker tag dlosatoes/fsst:fluree-v2.0.3 dlosatoes/fsst:v`python3 -m pip index versions fsst|grep fsst |sed -e 's/.*(//' -e 's/).*//'`-fluree-v2.0.3
docker build --no-cache -t dlosatoes/fsst:fluree-v2.0.1 . -f Dockerfile-2.0.1
docker tag dlosatoes/fsst:fluree-v2.0.1 dlosatoes/fsst:v`python3 -m pip index versions fsst|grep fsst |sed -e 's/.*(//' -e 's/).*//'`-fluree-v2.0.1
docker build --no-cache -t dlosatoes/fsst:fluree-v2.0.0 . -f Dockerfile-2.0.0
docker tag dlosatoes/fsst:fluree-v2.0.0 dlosatoes/fsst:v`python3 -m pip index versions fsst|grep fsst |sed -e 's/.*(//' -e 's/).*//'`-fluree-v2.0.0
