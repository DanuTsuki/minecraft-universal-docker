FROM ghcr.io/pterodactyl/yolks:java_17

USER root

RUN apt update && \
    apt install -y jq curl git bash && \
    apt clean && rm -rf /var/lib/apt/lists/*

USER container
