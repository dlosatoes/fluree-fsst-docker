#!/bin/bash
echo Pushing stable
docker push dlosatoes/fsst:fluree-v2.0.3
docker push dlosatoes/fsst:v`python3 -m pip index versions fsst|grep fsst |sed -e 's/.*(//' -e 's/).*//'`-fluree-v2.0.3
docker push dlosatoes/fsst:fluree-v2.0.1
docker push dlosatoes/fsst:v`python3 -m pip index versions fsst|grep fsst |sed -e 's/.*(//' -e 's/).*//'`-fluree-v2.0.1
docker push dlosatoes/fsst:fluree-v2.0.0
docker push dlosatoes/fsst:v`python3 -m pip index versions fsst|grep fsst |sed -e 's/.*(//' -e 's/).*//'`-fluree-v2.0.0
