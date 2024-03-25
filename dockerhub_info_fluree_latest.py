#!/usr/bin/python3
import sys
import requests
import subprocess
r = requests.get("https://hub.docker.com/v2/repositories/fluree/ledger/tags")
for candidate in r.json()["results"]:
    if candidate["name"] == "latest":
        latest_hash = candidate["digest"]
versionline = ""
for candidate in r.json()["results"]:
    if latest_hash == candidate["digest"] and candidate["name"] != "latest":
        if len(candidate["name"].split(".")) == 3:
            print("fluree-v" + candidate["name"])
            sys.exit(0)
print("NOTFOUND")
sys.exit(1)
