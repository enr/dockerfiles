FROM alpine:3.2

RUN apk add --update bash curl ca-certificates && \
    cd /tmp && \
    curl -sSL "https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64/glibc-2.21-r2.apk" > /tmp/glibc-2.21-r2.apk && \
    curl -sSL "https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64/glibc-bin-2.21-r2.apk" > /tmp/glibc-bin-2.21-r2.apk && \
    apk add --allow-untrusted /tmp/glibc-2.21-r2.apk && \
    apk add --allow-untrusted /tmp/glibc-bin-2.21-r2.apk && \
    /usr/glibc/usr/bin/ldconfig /lib /usr/glibc/usr/lib && \
    echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf

COPY scripts/install-java-oracle.sh /usr/local/bin/install-java-oracle
RUN chmod +x /usr/local/bin/install-java-oracle

ENV JAVA_VERSION_MAJOR 8
ENV JAVA_VERSION_MINOR 66 
ENV JAVA_VERSION_BUILD 17
RUN /usr/local/bin/install-java-oracle

RUN rm -rf /var/cache/apk/* && \
    rm /tmp/glibc-2.21-r2.apk && \
    rm /tmp/glibc-bin-2.21-r2.apk

ENV PATH $PATH:/opt/java/current/bin
