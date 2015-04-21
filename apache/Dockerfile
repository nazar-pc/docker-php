FROM php:5.6-apache
MAINTAINER Nazar Mokrynskyi <nazar@mokrynskyi.com>

# We'll need some additional packages

RUN apt-get update && \
	apt-get install -y --no-install-recommends \

# For bz2

		libbz2-dev \

# For gd

		libfreetype6-dev \
		libjpeg62-turbo-dev \
		libpng12-dev \

# For ftp

		libssl-dev \

# For mcrypt

		libmcrypt-dev \

# For memcached

		libmemcached-dev \
	&& \

# Cleanup

	apt-get autoremove -y && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* && \

# Install some extra PHP Extension

	docker-php-ext-install \
		bcmath \
		bz2 \
		exif \
		ftp \
		gd \
		gettext \
		hash \
		iconv \
		mbstring \
		mcrypt \
		mysqli \
		opcache \
		pdo_mysql \
		shmop \
		sockets \
		sysvmsg \
		sysvsem \
		sysvshm \
		zip \
	&& \

# Some extensions need to be installed via PECL

	pecl install apcu-beta memcached && \
	echo 'extension = apcu.so' > /usr/local/etc/php/conf.d/apcu.ini && \
	echo 'extension = memcached.so' > /usr/local/etc/php/conf.d/memcached.ini