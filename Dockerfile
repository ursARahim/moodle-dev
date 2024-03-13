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

COPY ./moodle /var/www/html
COPY ./apache/dev/php.ini /usr/local/etc/php/php.ini
RUN chown -R root:www-data /var/www/html
RUN chmod -R 0777 /var/www/html

RUN chown -R www-data: /var/www/moodledata
RUN chmod -R 777 /var/www/moodledata
