#!/usr/bin/env bash

mkdir -p ~/.gnupg \
    && echo "disable-ipv6" >> ~/.gnupg/dirmngr.conf \
    && apt-key adv --homedir ~/.gnupg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E5267A6C \
    && apt-key adv --homedir ~/.gnupg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C300EE8C \
    && echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu focal main" > /etc/apt/sources.list.d/ppa_ondrej_php.list \
    && apt-get update \
    && apt-get install -y php7.4 php7.4-fpm php7.4-cli \
       php7.4-pgsql php7.4-sqlite3 php7.4-gd \
       php7.4-curl php7.4-memcached \
       php7.4-imap php7.4-mysql php7.4-mbstring \
       php7.4-xml php7.4-zip php7.4-bcmath php7.4-soap \
       php7.4-intl php7.4-readline php7.4-xdebug \
       php7.4-msgpack php7.4-igbinary php7.4-ldap \
       php7.4-redis \
    && update-alternatives --set php /usr/bin/php7.4 \
    && update-alternatives --set phar /usr/bin/phar7.4 \
    && php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer \
    && sed -i "s/pm\.max_children = .*/pm.max_children = 20/" /etc/php/7.4/fpm/pool.d/www.conf \
    && sed -i "s/pm\.start_servers = .*/pm.start_servers = 10/" /etc/php/7.4/fpm/pool.d/www.conf \
    && sed -i "s/pm\.min_spare_servers = .*/pm.min_spare_servers = 5/" /etc/php/7.4/fpm/pool.d/www.conf \
    && sed -i "s/pm\.max_spare_servers = .*/pm.max_spare_servers = 10/" /etc/php/7.4/fpm/pool.d/www.conf \
    && sed -i 's/^;daemonize.*$/daemonize = no/g' /etc/php/7.4/fpm/php-fpm.conf \
    && sed -i 's@^error_log.*$@error_log = /proc/self/fd/2@g' /etc/php/7.4/fpm/php-fpm.conf
    # && echo "\n; Allow Vessel to set env vars for local dev\nclear_env=false" >> /etc/php/5.6/fpm/php-fpm.conf