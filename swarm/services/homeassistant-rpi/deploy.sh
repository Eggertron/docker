#!/bin/bash

# Home-Assistant

#docker run --init -d \
#       --name="home-assistant" \
#       -e "TZ=America/New_York" \
#       -v /PATH_TO_YOUR_CONFIG:/config \
#       --net=host \
#       homeassistant/home-assistant:stable

docker service create \
  --name "home-assistant" \
  --env TZ="America/New_York" \
  --publish=8123:8123/tcp \
  homeassistant/home-assistant


#  --mount=type=bind,src=config,dst=/config \
