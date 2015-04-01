FROM githubenr/nodejs

USER root

ENV DEBIAN_FRONTEND noninteractive

#RUN apt-get update -y && \
RUN apt-get install --no-install-recommends -y -q \
    libfreetype6 \
    libfontconfig

RUN unset DEBIAN_FRONTEND

USER node
ENV HOME /home/node
ENV PATH $PATH:$HOME/npm/bin

RUN npm install --global pageres
RUN npm install --global phantom-check
RUN npm install --global tmi
RUN npm install --global psi
RUN npm install --global phantomjs
RUN npm install --global casperjs
RUN npm install --global dnc

RUN curl -s -S -o /tmp/yslow-phantomjs-3.1.8.zip "http://yslow.org/yslow-phantomjs-3.1.8.zip" && \
    unzip /tmp/yslow-phantomjs-3.1.8.zip && \
    rm /tmp/yslow-phantomjs-3.1.8.zip

USER root
COPY scripts/docker-entrypoint.sh /usr/local/bin/entrypoint
RUN chmod +x /usr/local/bin/entrypoint

USER node
WORKDIR /home/node

ENTRYPOINT ["/usr/local/bin/entrypoint"]
