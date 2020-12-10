# Ngrok

## Docker Image Build
```
docker build -t ngrok .
```

## Docker Run
How to run
```
docker run --rm -e "NGROK_AUTHTOKEN=<your-token>" -e "NGROK_SERVICE=http" -e "NGROK_HOSTPORT=80" ngrok

or

docker run --rm -d -e "NGROK_AUTHTOKEN=<your-token>" -e "NGROK_SERVICE=http" -e "NGROK_HOSTPORT=192.168.1.123:80" ngrok
```

| env | description |
| --- | --- |
| NGROK_AUTHTOKEN | Your ngrok token |
| NGROK_SERVICE | The service to tunnel |
| NGROK_HOSTPORT | Port to expose. The default host is 127.0.0.1. You can specify an external ip, 192.168.1.123:8080 |
