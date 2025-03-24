#!/bin/bash
apt update
apt install -y nginx
echo "Hello from $(hostname)" > /var/www/html/index.html