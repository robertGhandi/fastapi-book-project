#!/bin/bash

# Ensure Nginx configuration is valid before starting
nginx -t || exit 1

# Start Nginx in the background
service nginx start

# Wait for a moment to make sure Nginx starts properly
sleep 2

# Start FastAPI with Uvicorn
exec uvicorn main:app --host 0.0.0.0 --port 8000
