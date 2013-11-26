#!/usr/bin/sh

function start_nginx {
    sudo nginx -c `realpath nginx.conf`
}

# Check if Nginx is not running
if [ ! -f /run/nginx.pid ]; then
    start_nginx
else
    sudo nginx -s quit
    start_nginx
fi
