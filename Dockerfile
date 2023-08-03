# Production Stage
FROM alpine

LABEL maintainer="3293172751nss@gmail.com" \
      org.opencontainers.image.source=https://github.com/openim-sigs/openim-base-image \
      org.opencontainers.image.description="OpenIM Sigs image" \
      org.opencontainers.image.licenses="MIT"

ARG GO111MODULE=on
ARG GOPROXY=https://goproxy.cn,direct

# Set environment variables
ENV GO111MODULE=$GO111MODULE \
    GOPROXY=$GOPROXY \
    SERVER_WORKDIR=/openim/openim-server \
    CHAT_WORKDIR=/openim/openim-chat \
    OPENKF_WORKDIR=/openim/openkf

WORKDIR /openim

RUN apk --no-cache add tzdata ca-certificates bash tzdata && \
    apk add --no-cache --virtual build-dependencies && \ 
    rm -rf /var/cache/apk/* &&\
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    echo "openim-sigs" > /etc/hostname && \
    for dir in "$SERVER_WORKDIR" "$CHAT_WORKDIR" "$OPENKF_WORKDIR"; do \
      for subdir in logs bin scripts config; do \
        mkdir -p "$dir/$subdir"; \
      done; \
    done && \
    mkdir -p /openim/tools

COPY ./README.md ./LICENSE ./
COPY get_os.sh get_arch.sh source.sh /openim/

RUN /openim/get_os.sh > /tmp/os && \
    /openim/get_arch.sh > /tmp/arch && \
    echo "export OS=$(cat /tmp/os)" >> /etc/profile && \
    echo "export ARCH=$(cat /tmp/arch)" >> /etc/profile && \
    rm /tmp/os /tmp/arch

# Set directory to map logs, config files, scripts, and SDK
VOLUME ["/openim", \
        "/openim/openim-server/logs", "/openim/openim-server/config", "/openim/openim-server/scripts", \
        "/openim/openim-chat/logs", "/openim/openim-chat/config", "/openim/openim-chat/scripts", \
        "/openim/openkf/logs", "/openim/openkf/config", "/openim/openkf/scripts"]

ENTRYPOINT ["/openim/source.sh"]

WORKDIR /openim
