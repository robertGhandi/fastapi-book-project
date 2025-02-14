# Use Python 3.12 as the base image
FROM python:3.12-slim

# Install necessary packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    nginx nginx-extras \
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

# Ensure the Nginx service runs properly
RUN mkdir -p /var/run/nginx && \
    chmod -R 777 /var/run/nginx

# Expose port 8080 for Nginx
EXPOSE 8080

# Copy start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Start both Nginx and Uvicorn using the script
CMD ["/start.sh"]
