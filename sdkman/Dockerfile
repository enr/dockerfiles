FROM openjdk:8u121-jdk-alpine

RUN apk add --update bash \
                     curl \
                     ca-certificates \
                     zip \
                     unzip \
                     git

RUN rm /bin/sh && ln -s `which bash` /bin/sh

# ENV USERNAME ops
# ENV HOME "/home/${USERNAME}"
# RUN addgroup -S "$USERNAME" && adduser -S -g "$USERNAME" -s /bin/bash -h ${HOME} "$USERNAME"
# USER "$USERNAME"
# ENV SDKMAN_DIR $HOME/.sdkman

ENV SDKMAN_DIR /opt/sdkman

RUN curl -s get.sdkman.io | bash

WORKDIR $SDKMAN_DIR

RUN set -x \
    && echo "sdkman_auto_answer=true" > $SDKMAN_DIR/etc/config \
    && echo "sdkman_auto_selfupdate=false" >> $SDKMAN_DIR/etc/config \
    && echo "sdkman_insecure_ssl=false" >> $SDKMAN_DIR/etc/config \
    && echo "sdkman_colour_enable=false" >> $SDKMAN_DIR/etc/config

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint
RUN chmod +x /usr/local/bin/docker-entrypoint
ENTRYPOINT ["/usr/local/bin/docker-entrypoint"]
