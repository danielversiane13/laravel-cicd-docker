#!/bin/bash

#-- Apply cache --#
echo -e "\n\e[1;35m** Applying cache\e[0m"
php artisan optimize:clear --quiet
php artisan optimize
php artisan config:clear

#-- Start server --#
echo -e "\n\e[1;35m** Starting server\e[0m"
php -S 0.0.0.0:80 -t public
