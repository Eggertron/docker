#!/bin/bash

if [ -z "$PUB_HOST" ]
then
    echo "PUB_HOST undefined"
    exit -1
fi

echo "$PUB_HOST" > pub_host

/root/.nvm/versions/node/v10.23.1/bin/node /root/.nvm/versions/node/v10.23.1/bin/ssb-server start start --host 0.0.0.0
$@
