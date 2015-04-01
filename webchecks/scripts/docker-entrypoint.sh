#!/usr/bin/env bash

echo $@

#  'dnc'
CLI_TOOLS=( 'node' 'npm' 'pageres' 'phantom-check' 'tmi' 'psi' 'phantomjs' 'casperjs' )
for tool in "${CLI_TOOLS[@]}"; do
	echo ""
	echo "--- Tool ${tool}"
	toolbin=$(which "$tool")
	echo "${toolbin}"
	sh -c "${toolbin} --version"
done

# dnc doesn't have --version and starts...
echo "--- Tool dnc"
toolbin=$(which dnc)
echo "${toolbin}"
