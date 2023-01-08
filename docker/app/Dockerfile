FROM --platform=linux/amd64 ubuntu:20.04

LABEL maintainer="Bayeer"

RUN useradd -ms /bin/bash -u 1337 vessel
WORKDIR /var/www/html

# Avoid prompts when building
ENV DEBIAN_FRONTEND noninteractive
ENV TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY scripts/*.sh /tmp/

RUN /tmp/ubuntu-install-basic.sh \
    && /tmp/ubuntu-install-nginx.sh \
    && /tmp/ubuntu-install-php7.4.sh \
    && apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY h5bp /etc/nginx/h5bp
COPY default /etc/nginx/sites-available/default
COPY xdebug.ini /etc/php/7.4/mods-available/xdebug.ini
COPY vessel.ini /etc/php/7.4/fpm/conf.d/99-vessel.ini
COPY vessel.ini /etc/php/7.4/cli/conf.d/99-vessel.ini

EXPOSE 80

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY start-container /usr/local/bin/start-container
RUN chmod +x /usr/local/bin/start-container

ENTRYPOINT ["start-container"]
