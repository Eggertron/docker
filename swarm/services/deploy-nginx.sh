#!/bin/bash

docker service create \
  --name=nginx \
  --publish=8880:80 \
  --publish=8888:8888 \
  --mount=type=bind,src=`pwd`/load-balance.template,dst=/etc/nginx/conf.d/load-balance.template \
  nginx
