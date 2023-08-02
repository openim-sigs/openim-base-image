# Production Stage
FROM alpine

LABEL org.opencontainers.image.source=https://github.com/openim-sigs/openim-base-image
LABEL org.opencontainers.image.description="OpenIM Sigs image"
LABEL org.opencontainers.image.licenses="MIT"

# Set go mod installation source and proxy
ARG GO111MODULE=on
ARG GOPROXY=https://goproxy.cn,direct
ENV GO111MODULE=$GO111MODULE
ENV GOPROXY=$GOPROXY

WORKDIR /openim

RUN apk --no-cache add tzdata ca-certificates bash

RUN mkdir -p $SERVER_WORKDIR/logs $SERVER_WORKDIR/bin $SERVER_WORKDIR/scripts $SERVER_WORKDIR/config && \
    mkdir -p $CHAT_WORKDIR/logs $CHAT_WORKDIR/bin $CHAT_WORKDIR/scripts $CHAT_WORKDIR/config && \
    mkdir -p $OPENKF_WORKDIR/logs $OPENKF_WORKDIR/bin $OPENKF_WORKDIR/scripts $OPENKF_WORKDIR/config

RUN echo "openim-sigs" > /etc/hostname

COPY ./README.md ./README.md
COPY ./LICENSE ./LICENSE

ENV SERVER_WORKDIR /openim/openim-server
ENV CHAT_WORKDIR /openim/openim-chat
ENV OPENKF_WORKDIR /openim/openkf

ENV OPENIM_SERVER_CONFIG_NAME $SERVER_WORKDIR/config/config.yaml
ENV OPENIM_SERVER_CMDDIR $SERVER_WORKDIR/scripts
ENV OPENIM_SERVER_LOGDIR $SERVER_WORKDIR/logs
ENV OPENIM_SERVER_BINDIR $SERVER_WORKDIR/_output

ENV OPENIM_CHAT_CONFIG_NAME $CHAT_WORKDIR/config/config.yaml
ENV OPENIM_CHAT_CMDDIR $CHAT_WORKDIR/scripts
ENV OPENIM_CHAT_LOGDIR $CHAT_WORKDIR/logs
ENV OPENIM_CHAT_BINDIR $CHAT_WORKDIR/bin

ENV OPENIM_OPENKF_CONFIG_NAME $OPENKF_WORKDIR/config/config.yaml
ENV OPENIM_OPENKF_CMDDIR $OPENKF_WORKDIR/scripts
ENV OPENIM_OPENKF_LOGDIR $OPENKF_WORKDIR/logs
ENV OPENIM_OPENKF_BINDIR $OPENKF_WORKDIR/bin

# Set directory to map logs, config files, scripts, and SDK
VOLUME ["/openim", \
        "/openim/openim-server/logs", "/openim/openim-server/config", "/openim/openim-server/scripts", \
        "/openim/openim-chat/logs", "/openim/openim-chat/config", "/openim/openim-chat/scripts", \
        "/openim/openkf/logs", "/openim/openkf/config", "/openim/openkf/scripts"]

WORKDIR /openim
