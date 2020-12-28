# Inlets

## Docker Image Build
```
docker build -t inlets .
```

## Docker Run
How to run
```
docker run --rm -e "INLETS_TOKEN=<your-token>" -e "INLETS_MODE=server" -e "INLETS_PORT=8090" inlets
```
| env | description |
| ----- | ------------ |
| INLETS_TOKEN | Your inlets token |
| INLETS_MODE | The mode to run inlets (server/client) |
| INLETS_PORT | Port to expose. |
| INLETS_REMOTE | Inlets Server IP |
| INLETS_UPSTREAM | Inlets Client IP |
