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

CMD ["nginx", "-g", "daemon off;"]
