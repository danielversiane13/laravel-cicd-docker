#!/bin/bash

#-- Remove cache --#
echo -e "\e[1;35m** Removing cache\e[0m"
php artisan optimize:clear

#-- Install dependencies --#
echo -e "\e[1;35m** Installing dependencies\e[0m"
composer install --prefer-dist --optimize-autoloader --no-interaction --quiet

#-- Start server --#
echo -e "\e[1;35m** Starting server\e[0m"
php -S 0.0.0.0:80 -t public
