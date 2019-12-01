### EGEOFFREY ###

### define base image
## the SDK version to bind to has to be passed by the builder so to select the right base image
ARG SDK_VERSION
ARG ARCHITECTURE
FROM egeoffrey/egeoffrey-sdk-alpine:${SDK_VERSION}-${ARCHITECTURE}

### install OS dependencies
RUN apk update && apk add musl-dev openssl-dev gcc libffi-dev && rm -rf /var/cache/apk/*

### install your module's dependencies
RUN pip install python-telegram-bot

### copy files into the image
COPY . $WORKDIR
