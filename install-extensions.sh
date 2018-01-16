#!/usr/bin/env bash
set -e

# We'll need some additional packages

apt-get update

# Install dependencies For bz2, gd, memcached and sodium

apt-get install -y --no-install-recommends \
	libbz2-dev \
	libfreetype6-dev \
	libjpeg62-turbo-dev \
	libpng-dev \
	libxpm-dev \
	libvpx-dev \
	libmemcached-dev \
	libsodium-dev

# Cleanup

apt-get clean
rm -rf /var/lib/apt/lists/*

# Configure GD package for JPEG support

docker-php-ext-configure gd \
	--with-freetype-dir=/usr/lib/x86_64-linux-gnu/ \
	--with-jpeg-dir=/usr/lib/x86_64-linux-gnu/ \
	--with-xpm-dir=/usr/lib/x86_64-linux-gnu/ \
	--with-vpx-dir=/usr/lib/x86_64-linux-gnu/ \

# Install some extra PHP Extension

docker-php-ext-install \
	bcmath \
	bz2 \
	exif \
	gd \
	gettext \
	mysqli \
	opcache \
	pdo_mysql \
	shmop \
	sockets \
	sodium \
	sysvmsg \
	sysvsem \
	sysvshm \
	zip

# Some extensions need to be installed via PECL

pecl install apcu memcached
echo 'extension = apcu.so' > /usr/local/etc/php/conf.d/apcu.ini
echo 'extension = memcached.so' > /usr/local/etc/php/conf.d/memcached.ini
