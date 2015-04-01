#!/usr/bin/env bash

[[ -n "$http_proxy" ]] && {
    npm config set proxy "$http_proxy"
    npm config set https-proxy "$http_proxy"
}

npm config set prefix ~/npm

echo "export PATH='$PATH:$HOME/npm/bin'" >> "${HOME}/.bashrc"
