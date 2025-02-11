# Use Python 3.12 as the base image
FROM python:3.12-slim

# Install Nginx
RUN apt update && apt install -y nginx

# Set working directory
WORKDIR /

# Copy project files
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy Nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80 (used by Nginx)
EXPOSE 80

# Start Nginx and FastAPI
CMD service nginx start && uvicorn main:app --host 0.0.0.0 --port 8000
