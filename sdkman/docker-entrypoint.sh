#!/bin/bash

set -eo pipefail

sdkman_init="${SDKMAN_DIR}/bin/sdkman-init.sh"
[[ -r "$sdkman_init" ]] || {
  echo "NOT FOUND ${sdkman_init}"
}
[[ -r "$sdkman_init" ]] && source "$sdkman_init"

exec "$@"
