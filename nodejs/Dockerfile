FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y || /bin/true
RUN apt-get install --no-install-recommends -y -q \
    curl \
    python \
    bzip2 \
    unzip \
    build-essential \
    git \
    ca-certificates

RUN unset DEBIAN_FRONTEND

ENV NODEJS_VERSION 0.12.2
RUN mkdir /nodejs && \
    curl -s -S http://nodejs.org/dist/v${NODEJS_VERSION}/node-v${NODEJS_VERSION}-linux-x64.tar.gz | tar xvzf - -C /nodejs --strip-components=1

ENV PATH $PATH:/nodejs/bin

RUN useradd -ms /bin/bash node

RUN mkdir -p /usr/local/bin
COPY scripts/docker-entrypoint.sh /usr/local/bin/entrypoint
RUN chmod +x /usr/local/bin/entrypoint
COPY scripts/npm-config.sh /usr/local/bin/npm-config
RUN chmod +x /usr/local/bin/npm-config

USER node
ENV HOME /home/node
WORKDIR /home/node

RUN /usr/local/bin/npm-config
ENV PATH $PATH:$HOME/npm/bin

ENTRYPOINT ["/usr/local/bin/entrypoint"]
