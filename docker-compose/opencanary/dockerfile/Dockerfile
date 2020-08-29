FROM ubuntu

LABEL maintainer="bboyhan@hotmail.com"

RUN apt-get update && \
    apt-get install -y \
    python-dev \
    python3-pip \
    sudo \
    build-essential \
    libssl-dev \
    libffi-dev 

RUN pip3 install virtualenv && \
    virtualenv env/ && \
    . env/bin/activate && \
    pip3 install setuptools==45 && \
    pip3 install opencanary && \
    pip3 install scapy && \
    pip3 install rdpy && \
    opencanaryd --copyconfig

EXPOSE 21

COPY entrypoint.sh /root/entrypoint.sh
WORKDIR /root
ENTRYPOINT ["/root/entrypoint.sh"]
CMD ["opencanaryd", "--dev"]
