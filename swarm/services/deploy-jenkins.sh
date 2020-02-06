#!/bin/bash

docker service create \
  --name=jenkins \
  --publish=8080:8080 \
  --publish=50000:50000 \
  --mount=type=volume,src=jenkins_home_data,dst=/var/jenkins_home \
  jenkins/jenkins:lts
