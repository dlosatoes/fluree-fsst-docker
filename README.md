# Docker image for fsst + flureedb

This repo is used to build a combined [fsst](https://github.com/dlosatoes/fluree-schema-scenario-tool) + [flureedb](https://github.com/fluree/ledger) image, and to put that image do [docker hub](https://hub.docker.com/r/dlosatoes/fsst/tags).

# Building and pushing after a new fsst release

This repo should not be used by most fsst or flureedb users as relatively up to date images should be available from [docker hub](https://hub.docker.com/r/dlosatoes/fsst/tags). It is possible though that a newer version of flureedb is available that has not yet been picked up on by the fsst maintainer yet and a manual build might be of use.

To build the docker image based on the latest version of fsst from [pypi](https://pypi.org/project/fsst/) and the latest FlureeDB image from [docker hub](https://hub.docker.com/r/fluree/ledger/tags), run the command:

```
make_docker.sh
```

After having been sucsesfully run by the fsst maintainer, the following command is used to

```
push_docker.sh
```

# Building and pushing after a new flureedb release

Builds and pushes by fsst maintainer, while in sync with fsst releases, may not be in sync with flureedb releases. The latest version of fsst will also
look at fluree on github, but only if the tag isn't available in the dockerhub repo maintained by the fsst maintainer. This should allow the flureedb
maintainer to push fsst+fluree docker images independent from the fsst maintainer, and make these available to explicit use by fsst users.

For the flureedb maintainer two alternate scripts are available.

```
make_docker_fluree.sh
```

and to push the built images:

```
make_docker.sh
```

# Future: smarter fsst

Currently the flureedb maintainer has not used the abouve scripts yet and its not know if they ever will. If they will it seems usefull to make fsst a little bit smarter with respect to both remote and local image usage. Right now, if a local image exists, tha timage is used regarless of newer versions with the used tag being available on docker hub. If the image does not exist, fsst will fetch the image, preferably from the current fsst maintainers docker, if that one does nt exist from the historic fsst mainainer, and if that doesn't exist either from the flureedb maintainer. For now this is workable but it's not ideal.

If the fluree maintainer starts using these scripts to upload new versions to docker hub on fluree releases, an updated strategy is desired for both local and docker hub hosted images.

Fsst should always check all three docker hub accounts to see if the tag is there and how old it is, it should then check if the newest available image for that tag exists locally and fetch it from docker hub if it doesn't. 

Right now this feature doesn't make any sense yet, but if the flureedb maintainer chooses to start using the scripts in this repo, this feature starts making sense.
