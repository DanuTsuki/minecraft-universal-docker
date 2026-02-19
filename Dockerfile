FROM ghcr.io/pterodactyl/yolks:java_17

USER root

RUN apk update && \
    apk add --no-cache jq curl bash git

USER container
