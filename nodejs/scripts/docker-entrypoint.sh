#!/usr/bin/env bash

echo $@

toolbin=$(which node)
echo "${toolbin}"
sh -c "${toolbin} --version"
