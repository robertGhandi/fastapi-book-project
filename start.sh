#!/bin/bash

# Start Nginx
service nginx start

# Start FastAPI with Uvicorn
uvicorn main:app --host 0.0.0.0 --port 8000
