#!/bin/bash


sudo docker service create \
  --name=pihole \
  --publish=8888:80/tcp \
  --publish=53:53/tcp \
  --publish=53:53/udp \
  --publish=67:67/udp \
  --publish=443:443/tcp \
  --env "TZ=America/New_York" \
  --env "WEBPASSWORD=password" \
  --mount=type=bind,src=/mnt/share/workspace/docker/pihole/etc-pihole,dst=/etc/pihole/ \
  --mount=type=bind,src=/mnt/share/workspace/docker/pihole/etc-dnsmasq.d,dst=/etc/dnsmasq.d/ \
  --dns-add=127.0.0.1 \
  --dns-add=1.1.1.1 \
  pihole/pihole:latest
