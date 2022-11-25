#!/bin/bash

rm -f /etc/nginx/sites-enabled/default
rm -f /etc/nginx/conf.d/default.conf
cp /tools/default.conf /etc/nginx/conf.d/


nginx -g "daemon off;"


