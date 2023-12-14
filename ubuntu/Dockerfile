# Production Stage
FROM ubuntu:22.04

LABEL maintainer="cubxxw@openim.io" \
      org.opencontainers.image.source=https://github.com/openim-sigs/openim-base-image \
      org.opencontainers.image.description="OpenIM Sigs Image" \
      org.opencontainers.image.licenses="MIT"

ARG GO111MODULE=on
ARG GOPROXY=https://goproxy.cn,direct

# Set environment variables
ENV GO111MODULE=$GO111MODULE \
    GOPROXY=$GOPROXY \
    SERVER_WORKDIR=/openim/openim-server \
    CHAT_WORKDIR=/openim/openim-chat \
    OPENKF_WORKDIR=/openim/openkf

# OpenIM Config Should pass the path
ENV OPENIM_SERVER_CONFIG_NAME=$SERVER_WORKDIR/config \
    OPENIM_SERVER_CMDDIR=$SERVER_WORKDIR/scripts \
    OPENIM_SERVER_LOGDIR=$SERVER_WORKDIR/logs \
    OPENIM_SERVER_BINDIR=$SERVER_WORKDIR/_output/bin \
    OPENIM_CHAT_CONFIG_NAME=$CHAT_WORKDIR/config/config.yaml \
    OPENIM_CHAT_CMDDIR=$CHAT_WORKDIR/scripts \
    OPENIM_CHAT_LOGDIR=$CHAT_WORKDIR/logs \
    OPENIM_CHAT_BINDIR=$CHAT_WORKDIR/_output/bin \
    OPENIM_OPENKF_CONFIG_NAME=$OPENKF_WORKDIR/config/config.yaml \
    OPENIM_OPENKF_CMDDIR=$OPENKF_WORKDIR/scripts \
    OPENIM_OPENKF_LOGDIR=$OPENKF_WORKDIR/logs \
    OPENIM_OPENKF_BINDIR=$OPENKF_WORKDIR/_output/bin

WORKDIR /openim

# Install required packages
RUN apt-get update && \
    apt-get install -y tzdata ca-certificates iproute2 lsof psmisc dnsutils && \
    ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    echo "openim-sigs" > /etc/hostname && \
    for dir in "$SERVER_WORKDIR" "$CHAT_WORKDIR" "$OPENKF_WORKDIR"; do \
      for subdir in logs _output/bin scripts deployments config; do \
        mkdir -p "$dir/$subdir"; \
      done; \
    done && \
    mkdir -p /openim/tools

COPY ./README.md ./LICENSE ./
COPY get_os.sh get_arch.sh source.sh /openim/tools/

RUN /openim/tools/get_os.sh > ~/os && \
    /openim/tools/get_arch.sh > ~/arch && \
    echo "export OS=$(cat ~/os)" >> /etc/profile && \
    echo "export ARCH=$(cat ~/arch)" >> /etc/profile && \
    chmod +x /openim/tools/*.sh && \
    cp /openim/tools/get_os.sh /usr/local/bin/get_os && \
    cp /openim/tools/get_arch.sh /usr/local/bin/get_arch

# Set directory to map logs, config files, scripts, and SDK
VOLUME ["/openim", \
        "/openim/openim-server/logs", "/openim/openim-server/config", "/openim/openim-server/scripts", "/openim/openim-server/deployments", "/openim/openim-server/_output/logs", \
        "/openim/openim-chat/logs", "/openim/openim-chat/config", "/openim/openim-chat/scripts","/openim/openim-chat/_output/logs", \
        "/openim/openkf/logs", "/openim/openkf/config", "/openim/openkf/scripts", "/openim/openkf/_output/bin"]

WORKDIR /openim

ONBUILD RUN OS=$(get_os) && \
            ARCH=$(get_arch)
