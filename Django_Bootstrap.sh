#!/bin/bash
yum update -y
yum install python35 -y
yum install python35-pip -y
pip install Django

###########
sleep 150
cd /home
/usr/local/bin/django-admin.py startproject myapp2
cd /home/myapp2

ipv4=`curl http://169.254.169.254/latest/meta-data/public-ipv4`
echo "ALLOWED_HOSTS = ['127.0.0.1', '"$ipv4"', 'localhost']" >>/home/myapp/myapp/settings.py
sleep 5
/usr/bin/python manage.py runserver 0.0.0.0:8000 &
