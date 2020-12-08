#!/bin/bash

docker service create \
  --name=registry \
  --publish=5000:5000/tcp \
  --mount=type=bind,src=/nfs/shared/registry,dst=/var/lib/registry \
  registry:2


if [[ ! -z "$(cat /etc/*release* | grep Rasp )" ]]
then
  docker service create \
    --name=registry \
    --publish=5000:5000/tcp \
    --mount=type=bind,src=/nfs/shared/registry,dst=/var/lib/registry \
    registry:2
fi
