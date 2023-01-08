#FROM --platform=linux/amd64 node:latest
#FROM --platform=linux/amd64 node:12.22.12-bullseye
#FROM --platform=linux/amd64 node:8.17.0-buster
FROM --platform=linux/amd64 node:16-alpine

LABEL maintainer="Bayeer"

WORKDIR /var/www/html

ARG uid=999

COPY scripts/*.sh /tmp/

RUN /tmp/alpine-install-nodejs.sh  \
    && rm -rf /var/cache/apk/*


RUN usermod -u $uid node
