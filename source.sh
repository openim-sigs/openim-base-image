#!/bin/sh
export OS=$(/openim/get_os.sh)
export ARCH=$(/openim/get_arch.sh)
exec "$@"