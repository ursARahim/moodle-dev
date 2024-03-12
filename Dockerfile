FROM moodlehq/moodle-php-apache:8.0

#RUN apt-get update && apt-get install -y\
#    libzip-dev \
#    libicu-dev \
#    libpng-dev \
#    libxml2-dev \
#    zlib1g-dev
#
#ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
#RUN install-php-extensions gd xdebug mysqli zip opcache xmlrpc intl soap

WORKDIR /var/www/html
COPY . .
COPY /var/www/html/moodle/apache/dev/php.ini /usr/local/etc/php/php.ini
RUN chown -R root:www-data .
RUN chmod -R 0755 .

RUN mkdir /var/www/moodledata

WORKDIR /var/www/moodledata
RUN chown -R www-data: .
RUN chmod -R 777 .

#RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
