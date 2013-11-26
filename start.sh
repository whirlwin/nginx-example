#!/usr/bin/sh

WWW_DIRECTORY="/data/www"

function start_nginx {
    sudo nginx -c `realpath nginx.conf`
}

# Set up files and directories if needed
if [ ! -d $WWW_DIRECTORY ]; then
    sudo mkdir $WWW_DIRECTORY
    chmod 755 $WWW_DIRECTORY
fi

# Expose all files in ./www
sudo cp ./www/* /data/www

# Check if Nginx is not running
if [ ! -f /run/nginx.pid ]; then
    start_nginx
else
    sudo nginx -s quit
    start_nginx
fi

if [ $(which google-chrome) ]; then
    google-chrome http://localhost
fi
