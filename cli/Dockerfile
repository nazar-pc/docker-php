FROM php:7.0-cli
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
		libxpm-dev \
		libvpx-dev \

# For ftp

		libssl-dev \

# For mcrypt

		libmcrypt-dev \

# For memcached

		libmemcached-dev \
	&& \

# Cleanup

	apt-get clean && \
	rm -rf /var/lib/apt/lists/* && \

# Configure GD package for JPEG support

	docker-php-ext-configure gd \
		--with-freetype-dir=/usr/lib/x86_64-linux-gnu/ \
		--with-jpeg-dir=/usr/lib/x86_64-linux-gnu/ \
		--with-xpm-dir=/usr/lib/x86_64-linux-gnu/ \
		--with-vpx-dir=/usr/lib/x86_64-linux-gnu/ \
	&& \

# Install some extra PHP Extension

	docker-php-ext-install \
		bcmath \
		bz2 \
		exif \
		ftp \
		gd \
		gettext \
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

	pecl install apcu-5.1.3 memcached && \
	echo 'extension = apcu.so' > /usr/local/etc/php/conf.d/apcu.ini && \
	echo 'extension = memcached.so' > /usr/local/etc/php/conf.d/memcached.ini
