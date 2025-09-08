#! /bin/bash

SERVERSESSIONNAME=
SERVERPASSWORD=
SERVERADMINPASSWORD=

./ShooterGameServer TheIsland?listen?SessionName=$SERVERSESSIONNAME?ServerPassword=$SERVERPASSWORD?ServerAdminPassword=$SERVERADMINPASSWORD -server -log
