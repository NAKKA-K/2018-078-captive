#!/bin/bash

sudo apt update

# Install python
sudo apt install python3 python3-dev
pip install -r requirements.txt
python3 manage.py migrate


# Settings uwsgi
sudo mkdir -p /etc/uwsgi/sites

sudo cp ./078-captive.ini /etc/uwsgi/sites/
sudo cp ./uwsgi.service /etc/systemd/system/


# Install Nginx
sudo apt install nginx

# Settings Nginx
sudo cp ./078-captive.conf /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/078-captive.conf /etc/nginx/sites-enabled


# Deploy backend
cp -r ../backend/ ~/
