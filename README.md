# Install Docker
Simply run
```
curl -fsSL https://get.docker.com | sudo sh
sudo usermod -aG docker $USER
sudo systemctl enable docker && sudo systemctl start docker
```
## Docker Swarm Ports
Now open the following ports
- 2376/tcp
- 2377/tcp
- 7946/tcp
- 7946/udp
- 4789/udp

For example, opening the ports on a Raspberry Pi (Debian)
```
sudo ufw allow 22/tcp
sudo ufw limit ssh/tcp
sudo ufw allow 2376/tcp
sudo ufw allow 2377/tcp
sudo ufw allow 7946/tcp
sudo ufw allow 7946/udp
sudo ufw allow 4789/udp
sudo ufw reload
```
# docker-compose
Some Docker Compose Configurations that I use


# Netdata
Run Netdata in Docker using the following command
```
curl -sS https://raw.githubusercontent.com/Eggertron/docker/master/netdata | sh
```
