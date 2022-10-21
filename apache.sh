#!/bin/bash
apt update
apt install apache2 -y
systemctl start apache2
echo "Hi there from $(hostname -f)" > /var/www/html/index.html