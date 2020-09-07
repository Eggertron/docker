#!/bin/sh

./ngrok authtoken $NGROK_AUTHTOKEN
$@
