#!/bin/bash

# Home-Assistant

#docker run --init -d \
#	--name="home-assistant" \
#	-e "TZ=America/New_York" \
#	-v /PATH_TO_YOUR_CONFIG:/config \
#	--net=host \
#      	homeassistant/home-assistant:stable

docker service create \
  --name "home-assistant" \
  --env TZ="America/New_York" \
  --publish=8123:8123/tcp \
  homeassistant/home-assistant


#  --mount=type=bind,src=config,dst=/config \

if [[ ! -z "$(cat /etc/*release* | grep 'Rasp')" ]]
then
  docker service create \
  --name "home-assistant" \
  --env TZ="America/New_York" \
  --publish=8123:8123/tcp \
  --mount=type=bind,src=/nfs/share/homeassistant,dst=/config \
  homeassistant/raspberrypi3-homeassistant:stable
fi

