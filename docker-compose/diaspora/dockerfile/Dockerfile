FROM ruby:2.6.6-slim-stretch

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install -y -qq \
        build-essential \
        cmake \
        curl \
        ghostscript \
        git \
        imagemagick \
        libcurl4-openssl-dev \
        libidn11-dev \
        libmagickwand-dev \
        libmariadbclient-dev \
        libpq-dev \
        libssl-dev \
        libxml2-dev \
        libxslt-dev \
        redis-server \
        libgmp-dev \
        nodejs \
        sudo \
    && \
    rm -rf /var/lib/apt/lists/*


ENV HOME="/home/diaspora" \
    GEM_HOME="/diaspora/vendor/bundle"

RUN adduser \
    --disabled-login \
    --disabled-password \
    --shell /bin/sh \
    --gecos "" \
    diaspora && \
    mkdir /diaspora && \
    cd $HOME && \
    git clone -b master https://github.com/diaspora/diaspora.git && \
    gem update --system && \
    chown -R diaspora:diaspora $HOME /diaspora /usr/local/lib/ruby

USER diaspora
WORKDIR /home/diaspora/diaspora

RUN cp config/database.yml.example config/database.yml && \
    cp config/diaspora.yml.example config/diaspora.yml && \
    sed -i 's/  password: ""/  password: "password"/g' config/database.yml && \
    sed -i 's/  host: "localhost"/  host: "postgres"/g' config/database.yml && \
    sed -i 's+    #url: "https://example.org/"+    url: "http://192.168.50.203:3000"+g' config/diaspora.yml && \
    sed -i "s+    #certificate_authorities: '/etc/ssl/certs/ca-certificates.crt'+    certificate_authorities: '/etc/ssl/certs/ca-certificates.crt'+g" config/diaspora.yml && \
    sed -i "s/    #rails_environment: 'development'/    rails_environment: 'production'/g" config/diaspora.yml && \
    sed -i 's/    #require_ssl: true/    require_ssl: true/g' config/diaspora.yml && \
    sed -i "s+    #redis: 'redis://example_host'+    redis: 'redis://redis'+g" config/diaspora.yml
    
RUN gem install bundler && \
    bundle update --bundler && \
    script/configure_bundler && \
    bin/bundle install

EXPOSE 3000/tcp
COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["/home/diaspora/diaspora/script/server"]
