#!/bin/bash

sudo apt update
sudo apt install apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2
echo "Hello, World!" | sudo tee /var/www/html/index.html
sudo systemctl restart apache2