#!/bin/bash

docker run --rm \
	-v '/dev/dri:/dev/dri' \
	-v '/tmp/.X11-unix:/tmp/.X11-unix' \
	-v '/dev/shm:/dev/shm' \
	-v "/run/user/${UID}/pulse:/run/user/${UID}/pulse" \
	-v '/etc/machine-id:/etc/machine-id' \
	-v "steam_downloads:/tmp/Downloads" \
	-v "steam_local:/home/steam/.local" \
	-v "steam_local:/home/steam/.local" \
	-v "steam_cache:/home/steam/.cache" \
	-v "steam_steam:/home/steam/.steam" \
	-e "DISPLAY=" \
	--privileged \
	steamos
