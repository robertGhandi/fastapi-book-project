# Use Python 3.12 as the base image
FROM python:3.12-slim

# Install necessary packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    nginx supervisor \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set working directory inside the container
WORKDIR /app

# Copy project files to /app
COPY . /app

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy Nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Copy Supervisor configuration
COPY supervisord.conf /etc/supervisor/supervisord.conf

# Expose port 8080 for Nginx
EXPOSE 8080

# Start Supervisord, which manages Nginx and Uvicorn
CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]
