#!/usr/bin/env bash

npm config set prefix ~/npm
npm config set loglevel warn

echo "export PATH='$PATH:$HOME/npm/bin'" >> "${HOME}/.bashrc"
