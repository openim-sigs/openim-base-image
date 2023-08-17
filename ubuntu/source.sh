#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

export OS=$(/openim/tools/get_os.sh)
export ARCH=$(/openim/tools/get_arch.sh)

exec "$@"