# Utiliser une image PHP avec Apache
# FROM php:7.4-apache

# Utiliser une image PHP avec Apache
FROM php:8.2-apache

# Installer les extensions PHP nécessaires
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd \
    && docker-php-ext-install zip \
    && docker-php-ext-install mysqli
    

RUN apt-get update && apt-get install -y libtidy-dev && docker-php-ext-install tidy \
    && docker-php-ext-install opcache

RUN docker-php-ext-configure gd --with-freetype --with-jpeg

# Install exif extension
RUN docker-php-ext-install exif

RUN apt-get update && apt-get install -y libicu-dev

# Install intl extension
RUN docker-php-ext-install intl

RUN apt-get update && \
    apt-get install -y libxml2-dev

# Install soap extension
RUN docker-php-ext-install soap

# Set PHP configurations if needed
RUN echo "max_input_vars = 10000" >> /usr/local/etc/php/conf.d/moodle.ini

# Copier les fichiers de Moodle dans le conteneur
COPY ./moodle /var/www

# Copier le fichier php.ini personnalisé dans le bon répertoire
COPY ./php.ini /usr/local/etc/php/

# Donner les droits d'accès à Apache
RUN chown -R www-data:www-data /var/www/html

# Exposer le port 80
EXPOSE 80
