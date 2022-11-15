#!/bin/bash

nginx -g "daemon off;"

echo "reached here" > /reached_here.txt

rm -rf /etc/nginx/sites-available/default
mv /tools/default.conf /etc/nginx/conf.d/
nginx -s reload
