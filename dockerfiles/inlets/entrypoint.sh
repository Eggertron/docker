#!/bin/sh

echo "Processing Input..."
echo "Token: $INLETS_TOKEN"
echo "Mode: $INLETS_MODE"
echo "Port: $INLETS_PORT"
echo "Remote: $INLETS_REMOTE"
echo "Upstream: $INLETS_UPSTREAM"

if [ -z "$INLETS_TOKEN" ]
then
    $INLETS_TOKEN=$(head -c 16 /dev/urandom | shasum | cut -d" " -f1)
fi

if [ "$INLETS_MODE" = "server" ]
then
    echo "TOKEN: $INLETS_TOKEN"
    ./inlets server  --port=$INLETS_PORT --token=$INLETS_TOKEN
fi

if [ "$INLETS_MODE" = "client" ]
then
    echo "Client Mode"
    ./inlets client --remote=$INLETS_REMOTE --upstream=$INLETS_UPSTREAM --token=$INLETS_TOKEN
fi
$@
