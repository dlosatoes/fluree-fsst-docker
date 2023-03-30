#!/usr/bin/python3
import sys
import requests
import subprocess
r = requests.get("https://api.github.com/repos/fluree/ledger/releases")
latest_date = ""
latest_beta_date = ""
latest_release = None
latest_beta_release = None
for release in r.json():
    if release["published_at"] > latest_date and not release["prerelease"]:
        latest_date = release["published_at"]
        latest_release = release
    if release["published_at"] > latest_beta_date and release["prerelease"] and "beta" in release["tag_name"]:
        latest_beta_date = release["published_at"]
        latest_beta_release = release
if len(sys.argv) > 1 and sys.argv[1] == "beta":
    print(latest_beta_release["tag_name"])
    latest_release = latest_beta_release
else:
    print(latest_release["tag_name"])
command = ["/usr/bin/git", "clone", "--depth", "1", "--branch", latest_release["tag_name"], "https://github.com/fluree/ledger.git", "."]
subprocess.run(command)
