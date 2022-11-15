#!/bin/bash

rm -rf /etc/nginx/sites-enabled/default
mv /tools/default.conf /etc/nginx/conf.d/


nginx -g "daemon off;"


