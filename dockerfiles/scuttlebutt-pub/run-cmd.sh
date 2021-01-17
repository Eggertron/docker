#!/bin/bash

PUB_HOST=$(cat pub_host)
PUB_ID=$(/root/.nvm/versions/node/v10.23.1/bin/ssb-server whoami | grep id | awk '{print $2}' | sed -r 's/"//g')

/root/.nvm/versions/node/v10.23.1/bin/ssb-server publish --type about $PUB_ID --name Edgars-test-pub
./invite.sh
