FROM composer:2.0 as composer
FROM php:8.0 as app

RUN apt-get update -y && apt-get install -y openssl zip unzip git libxml2 libxml2-dev libpng-dev libzip-dev libonig-dev libsodium-dev nano vim bash-completion iputils*
RUN docker-php-ext-install pdo pdo_mysql mysqli mbstring soap gd zip xml

COPY --from=composer /usr/bin/composer /usr/bin/composer

WORKDIR /app

COPY . .

RUN composer install --prefer-dist --optimize-autoloader --no-interaction --no-dev

RUN chmod 777 -R /app/storage/ && \
    chmod 777 -R /app/bootstrap/cache/

ENTRYPOINT [ "./.docker/production/app_entrypoint.sh" ]
