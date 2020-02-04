#!/bin/bash

# Enable firewall ports for Docker Swarm

sudo ufw status verbose
sudo ufw allow 2377/tcp
sudo ufw allow 7946/tcp
sudo ufw allow 7946/udp
sudo ufw allow 4789/udp
sudo ufw status verbose
