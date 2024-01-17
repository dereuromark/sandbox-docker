FROM php:8.2-fpm

ARG UNAME=www-data
ARG UGROUP=www-data
ARG UID=1000
ARG GID=1000
RUN usermod  --uid $UID $UNAME
RUN groupmod --gid $GID $UGROUP

RUN apt-get update \
  && LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  gnupg ssh nano mc

RUN curl -sL https://deb.nodesource.com/setup_20.x | bash - \
  && mkdir -p /usr/share/man/man1

RUN apt-get update \
  && LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  nodejs antiword libreoffice docx2txt mariadb-client git mc \
  pdftk curl ghostscript imagemagick poppler-utils ruby \
  ruby-dev libmcrypt-dev

# RUN docker-php-ext-install \
#  intl gd mcrypt mysqli imap zip mbstring xml sqlite3
#

#RUN pecl install imagick \
#  && docker-php-ext-enable imagick

# install intl
RUN apt-get install -y zlib1g-dev libicu-dev g++ \
  && docker-php-ext-configure intl \
  && docker-php-ext-install -j$(nproc) intl

# install mysql
RUN apt-get install -y mariadb-client \
  && docker-php-ext-configure pdo_mysql \
  && docker-php-ext-install -j$(nproc) pdo_mysql


# install imap
RUN apt-get install -y libc-client-dev libkrb5-dev \
  && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
  && docker-php-ext-install -j$(nproc) imap

# install GD
RUN apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-configure gd --with-jpeg=/usr/include --with-freetype=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

# install Imagemagick & PHP Imagick ext
RUN apt-get install -y \
        libmagickwand-dev --no-install-recommends

# install mcrypt
RUN pecl install mcrypt-1.0.7 \
    && docker-php-ext-enable mcrypt

# install zip
RUN apt-get install -y zlib1g-dev libzip-dev zip \
  && docker-php-ext-configure zip \
  && docker-php-ext-install -j$(nproc) zip

RUN pecl install imagick && docker-php-ext-enable imagick

#install xdebug
#RUN pecl install xdebug-2.9.0 && docker-php-ext-enable xdebug

RUN docker-php-ext-install opcache

# remove not necessary files
RUN rm -rf /var/lib/apt/lists/*


# install bower & embed-js
RUN npm install -g bower embed-js

# install sass
RUN gem install sass

RUN echo "memory_limit = 512M" >> /usr/local/etc/php/conf.d/sandbox.ini \
 && echo "max_execution_time = 60" >> /usr/local/etc/php/conf.d/sandbox.ini \
 && echo "max_input_vars = 10000" >> /usr/local/etc/php/conf.d/sandbox.ini

RUN echo "[opcache]" >> /usr/local/etc/php/conf.d/opcache.ini \
 && echo "opcache.enable=1" >> /usr/local/etc/php/conf.d/opcache.ini \
 && echo "opcache.revalidate_freq=0" >> /usr/local/etc/php/conf.d/opcache.ini \
 && echo "opcache.validate_timestamps=1" >> /usr/local/etc/php/conf.d/opcache.ini \
 && echo "opcache.max_accelerated_files=10000" >> /usr/local/etc/php/conf.d/opcache.ini \
 && echo "opcache.memory_consumption=192" >> /usr/local/etc/php/conf.d/opcache.ini \
 && echo "opcache.max_wasted_percentage=10" >> /usr/local/etc/php/conf.d/opcache.ini \
 && echo "opcache.interned_strings_buffer=16" >> /usr/local/etc/php/conf.d/opcache.ini \
 && echo "opcache.fast_shutdown=1" >> /usr/local/etc/php/conf.d/opcache.ini \
 && echo "" >> /usr/local/etc/php/conf.d/xdebug.ini \
 #&& echo "[xdebug]" >> /usr/local/etc/php/conf.d/xdebug.ini \
 #&& echo "xdebug.profiler_enable = 0;" >> /usr/local/etc/php/conf.d/xdebug.ini \
 #&& echo "xdebug.profiler_enable_trigger = 1;" >> /usr/local/etc/php/conf.d/xdebug.ini \
 #&& echo "xdebug.profiler_output_dir=/tmp" >> /usr/local/etc/php/conf.d/xdebug.ini

RUN sed -i 's/;pm.status_path = \/status/pm.status_path = \/fpm-status/' /usr/local/etc/php-fpm.d/www.conf

WORKDIR /var/www
