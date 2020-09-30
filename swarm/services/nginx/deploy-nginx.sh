#!/bin/bash

# Generate SSL Certs for the ssl template example
if [[ ! -f "nginx-selfsigned.key" ]]
then
    sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout nginx-selfsigned.key -out nginx-selfsigned.crt
fi

docker service create \
  --name=nginx \
  --publish=8880:80 \
  --publish=8888:8888 \
  --publish=8881:8881 \
  --publish=443:443 \
  --mount=type=bind,src=`pwd`/templates,dst=/etc/nginx/templates \
  --mount=type=bind,src=`pwd`/nginx-selfsigned.key,dst=/etc/ssl/private/nginx-selfsigned.key \
  --mount=type=bind,src=`pwd`/nginx-selfsigned.crt,dst=/etc/ssl/certs/nginx-selfsigned.crt \
  nginx
