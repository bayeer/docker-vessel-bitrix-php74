#!/bin/sh

set -eux \
    && apk --no-cache add yarn \
    && echo http://dl-cdn.alpinelinux.org/alpine/edge/community/ >> /etc/apk/repositories \
    && apk --no-cache add shadow
