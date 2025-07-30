FROM debian:11

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y nginx openssl

# Clean cached files to reduce image size
RUN apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# Generate a self-signed certificate with:
# - RSA 4096-bit key
# - SHA-256 signature
# - valid for 365 days
# - no passphrase on key
RUN openssl req -x509 \
  -newkey rsa:4096 \
  -keyout /etc/ssl/private/nginx-selfsigned.key \
  -out /etc/ssl/certs/nginx-selfsigned.crt \
  -sha256 \
  -days 365 \
  -nodes \
  -subj "/C=PT/ST=Lisboa/L=Lisboa/O=42/OU=student/CN=jqueijo-"

# Remove default site to prevent serving unwanted content
RUN rm /etc/nginx/sites-enabled/default

# Remove weak protocols from global nginx.conf
RUN sed -i 's/ssl_protocols .*;/ssl_protocols TLSv1.2 TLSv1.3;/' /etc/nginx/nginx.conf

ARG NGINX_PORT
# Document that the container listens on HTTPS port 443
EXPOSE ${NGINX_PORT}

CMD ["nginx", "-g", "daemon off;"]
