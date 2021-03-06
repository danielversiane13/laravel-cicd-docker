#!/bin/bash

#-- Apply cache --#
echo -e "\e[1;35m** Applying cache\e[0m"
php artisan optimize:clear
php artisan optimize
php artisan config:clear

#-- Start server --#
echo -e "\e[1;35m** Starting server\e[0m"
php -S 0.0.0.0:80 -t public
