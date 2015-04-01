FROM progrium/busybox

RUN opkg-install curl bash

RUN mkdir -p /usr/local/bin
COPY scripts/install-java-oracle.sh /usr/local/bin/install-java-oracle
RUN chmod +x /usr/local/bin/install-java-oracle

RUN /usr/local/bin/install-java-oracle
