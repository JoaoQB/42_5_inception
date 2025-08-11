FROM debian:11

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y nodejs

# Clean cached files to reduce image size
RUN apt-get clean && \
rm -rf /var/lib/apt/lists/*
