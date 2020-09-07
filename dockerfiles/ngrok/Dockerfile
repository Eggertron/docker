FROM alpine

ENV NGROK_AUTHTOKEN= \
    NGROK_SERVICE= \
    NGROK_HOSTPORT=

RUN apk add --no-cache curl \
    && curl -fsSL https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip -o ngrok.zip \
    && unzip ngrok.zip \
    && apk del curl \
    && rm -rf /var/cache/apk/*

COPY entrypoint.sh entrypoint.sh
COPY start-ngrok.sh start-ngrok.sh

ENTRYPOINT ["./entrypoint.sh"]
CMD ["./start-ngrok.sh"]
