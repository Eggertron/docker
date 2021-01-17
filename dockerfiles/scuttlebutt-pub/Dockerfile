FROM ubuntu

EXPOSE 8008/tcp

RUN apt-get update && apt-get install -y curl \
    && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

RUN export NVM_DIR="$HOME/.nvm" \
    && [ -s "$NVM_DIR/nvm.sh" ] \
    && \. "$NVM_DIR/nvm.sh" \
    && [ -s "$NVM_DIR/bash_completion" ] \
    && \. "$NVM_DIR/bash_completion" \
    && nvm install 10 \
    && nvm alias default 10 \
    && npm config set user 0 \
    && npm install -g ssb-server

COPY entrypoint.sh entrypoint.sh
COPY run-cmd.sh run-cmd.sh

ENTRYPOINT ["./entrypoint.sh"]
CMD ["./run-cmd.sh"]
