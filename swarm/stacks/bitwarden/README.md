# Bitwarden

## Docker Swarm

### Bitwarden on Raspberry Pi
For the Raspberry Pi we will use the Bitwarden RS image since.
```
docker service create \
  --name=bitwardenrs-42561 \
  --publish=42561:8080/tcp \
  bitwardenrs/server

```

### Bitwarden on Raspberry pi with persistent data
```
docker service create \
  --name=bitwardenrs-42561 \
  --publish=42561:8080/tcp \
  --mount=type=volume,src=bitwarden,dst=/config \
  bitwardenrs/server

```
