# Production Stage
FROM alpine

LABEL maintainer="3293172751nss@gmail.com" \
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

RUN apk --no-cache add tzdata ca-certificates bash && \
    rm -rf /var/cache/apk/* && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    echo "openim-sigs" > /etc/hostname && \
    mkdir -p "$SERVER_WORKDIR/logs" "$SERVER_WORKDIR/bin" "$SERVER_WORKDIR/scripts" "$SERVER_WORKDIR/config" && \
    mkdir -p "$CHAT_WORKDIR/logs" "$CHAT_WORKDIR/bin" "$CHAT_WORKDIR/scripts" "$CHAT_WORKDIR/config" && \
    mkdir -p "$OPENKF_WORKDIR/logs" "$OPENKF_WORKDIR/bin" "$OPENKF_WORKDIR/scripts" "$OPENKF_WORKDIR/config" && \
    mkdir -p /openim/tools

COPY --chown=root:root ./README.md ./LICENSE ./
COPY --chown=root:root get_os.sh get_arch.sh source.sh /openim/tools/

RUN /openim/tools/get_os.sh > ~/os && \
    /openim/tools/get_arch.sh > ~/arch && \
    echo "export OS=$(cat ~/os)" >> /etc/profile && \
    echo "export ARCH=$(cat ~/arch)" >> /etc/profile && \
    chmod +x /openim/tools/*.sh && \
    cp /openim/tools/get_os.sh /bin/get_os && \
    cp /openim/tools/get_arch.sh /bin/get_arch

ONBUILD RUN OS=$(get_os) && \
            ARCH=$(get_arch)