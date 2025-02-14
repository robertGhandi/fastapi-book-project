#!/bin/bash

# Ensure Nginx directories exist
mkdir -p /var/run/nginx /var/log/nginx
chmod -R 777 /var/run/nginx /var/log/nginx

# Start Nginx
service nginx start || (cat /var/log/nginx/error.log && exit 1)

# Start FastAPI with Uvicorn
uvicorn main:app --host 127.0.0.1 --port 8000 --proxy-headers
