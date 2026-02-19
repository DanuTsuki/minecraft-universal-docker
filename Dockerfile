FROM ghcr.io/pterodactyl/yolks:java_17

USER root

# Install required packages (Debian-based image)
RUN apt update && \
    apt install -y git curl jq bash && \
    apt clean && rm -rf /var/lib/apt/lists/*

# Set working directory (Pterodactyl mount point)
WORKDIR /home/container

# Clone engine repository
RUN git clone https://github.com/DanuTsuki/minecraft-universal-engine.git engine

# Move files into container root
RUN cp -r engine/* . && \
    rm -rf engine

# Ensure execution permissions
RUN chmod +x engine.sh && \
    chmod -R +x core

USER container
