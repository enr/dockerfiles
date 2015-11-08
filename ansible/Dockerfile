FROM alpine:3.2

RUN apk add --update bash \
                     curl \
                     ca-certificates \
                     openssh-client \
                     py-pip \
                     build-base \
                     python-dev \
                     py-boto

RUN pip install --upgrade pip

RUN pip install ansible

RUN rm -rf /var/cache/apk/*
