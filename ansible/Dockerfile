FROM python:2.7.13-alpine

RUN apk add --update gcc \
                     libffi-dev \
                     musl-dev \
                     openssl-dev \
                     perl \
                     sshpass \
                     bash \
                     curl \
                     ca-certificates \
                     openssh-client \
                     git
                     #\
                     #py-pip \
                     #build-base \
                     #python-dev \
                     #py-boto

RUN pip install --upgrade pip

RUN pip install ansible
