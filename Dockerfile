FROM ghcr.io/pterodactyl/yolks:java_17

USER root

# Install required packages
RUN apk update && \
    apk add --no-cache git curl jq bash

# Set working directory
WORKDIR /home/container

# Clone engine repository
RUN git clone https://github.com/DanuTsuki/minecraft-universal-engine.git engine

# Move files to container root
RUN cp -r engine/* . && \
    rm -rf engine

# Ensure permissions
RUN chmod +x engine.sh && \
    chmod -R +x core

USER container
