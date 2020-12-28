FROM alpine

ENV INLETS_TOKEN= \
    INLETS_MODE= \
    INLETS_PORT= \
    INLETS_REMOTE= \
    INLETS_UPSTREAM= 

RUN apk add --no-cache curl \
    && curl -sLS https://get.inlets.dev | sh \
    && apk del curl \
    && rm -rf /var/cache/apk/*

COPY entrypoint.sh entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
