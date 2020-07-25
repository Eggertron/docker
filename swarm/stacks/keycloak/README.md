# Keycloak
Keycloak does not have builds for ARM

## Run normal docker
```
docker run -p 8080:8080 -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=admin quay.io/keycloak/keycloak:11.0.0
```

## Run in swarm
```
docker service create \
  --name "keycloak" \
  --env KEYCLOAK_USER='admin' \
  --env KEYCLOAK_PASSWORD='admin' \
  --publish=42569:8080/tcp \
  quay.io/keycloak/keycloak:11.0.0

```
