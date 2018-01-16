# More feature-complete PHP Docker images based on official images
Images provided are based on PHP 7.2 (apache, cli and fpm variants) and contains additional extensions that you'll likely need in most, even advanced applications (similar set of extensions provided by packaged PHP in major Linux distributives).

PHP:
* bcmath
* bz2
* exif
* gd
* gettext
* mysqli
* opcache
* pdo_mysql
* shmop
* sockets
* sodium
* sysvmsg
* sysvsem
* sysvshm
* zip

PECL:
* APCu
* memcached

## How to use
Usage is similar to [official images](https://registry.hub.docker.com/_/php/), but use `nazarpc/php:apache`, `nazarpc/php:cli` and `nazarpc/php:fpm` instead of original names.

## Questions?
Open an issue and ask your question there:)

## License
Public Domain
