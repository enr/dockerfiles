#!/bin/bash

set -eo pipefail

[[ -r "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

exec "$@"
