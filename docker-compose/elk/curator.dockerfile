FROM alpine:3.6

RUN apk --no-cache add python py-setuptools py-pip gcc libffi py-cffi python-dev libffi-dev py-openssl musl-dev linux-headers openssl-dev libssl1.0 && \
    pip install elasticsearch-curator==5.8.1 && \
    apk del py-pip gcc python-dev libffi-dev musl-dev linux-headers openssl-dev

USER nobody:nobody

ENTRYPOINT ["/usr/bin/curator"]
