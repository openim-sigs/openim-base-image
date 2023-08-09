ARCH=$(uname -m | tr '[:upper:]' '[:lower:]')

case "$ARCH" in
    "x86_64"*)
        ARCH="amd64"
        ;;
    "i?86_64"*)
        ARCH="amd64"
        ;;
    "amd64"*)
        ARCH="amd64"
        ;;
    "aarch64"*)
        ARCH="arm64"
        ;;
    "arm64"*)
        ARCH="arm64"
        ;;
    "arm"*)
        ARCH="arm"
        ;;
    "i?86"*)
        ARCH="386"
        ;;
    "s390x"*)
        ARCH="s390x"
        ;;
    "ppc64le"*)
        ARCH="ppc64le"
        ;;
    *)
        echo "Unsupported host arch. Must be amd64, 386, arm, arm64, s390x or ppc64le."
        exit 1
        ;;
esac

export ARCH=$ARCH
echo $ARCH