#!/bin/sh

hostIP=${1:-10.10.11.181}
folder=${2:-/data/server/data/nginx}


apt install -y nfs-common nginx
rm -rf /etc/nginx/*
mount -t nfs $hostIP:$folder /etc/nginx
/etc/nginx/site.d/startup.sh
nginx -s reload
echo $(hostname -I | awk '{print $1}') >> /etc/nginx/site.d/.host
