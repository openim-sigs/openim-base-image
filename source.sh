#!/bin/bash
export OS=$(/openim/tools/get_os.sh)
export ARCH=$(/openim/tools/get_arch.sh)
exec "$@"
