#!/bin/bash

PUB_HOST=$(cat pub_host)

INVITE=$(/root/.nvm/versions/node/v10.23.1/bin/ssb-server invite.create 1 | sed -r 's/0.0.0.0/$PUB_HOST/g')
echo $INVITE
