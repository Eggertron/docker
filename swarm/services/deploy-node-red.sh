#!/bin/bash

docker service create \
  --name=node-red \
  --publish=1880:1880/tcp \
  --mount=type=volume,src=node-red_user_data,dst=/data \
  nodered/node-red
