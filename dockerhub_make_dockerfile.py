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
            versionline = "FROM fluree/ledger:" + candidate["name"]
if not versionline:
    print("No version found")
    sys.exit(1)
with open("Dockerfile-latest-dockerhub-body", encoding="utf8") as infile:
    body = infile.read()
with open("Dockerfile-latest-dockerhub", "w", encoding="utf8") as outfile:
    outfile.write(versionline)
    outfile.write("\n")
    outfile.write(body)
print("Done")
