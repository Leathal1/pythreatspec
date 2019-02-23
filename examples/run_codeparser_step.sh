#!/usr/bin/env bash

#if [ ${1: -14} == "_components.py" ]; then
#name=${1:0:16}
#else
name=$1
#fi

echo "Running universal parser for $name"
source ../venv/bin/activate
../universal.py -p "$name" ${name}*.go
deactivate

echo "Running mermaid DFD reporting tool"
pushd ../report_dfd
source ../venv/bin/activate
python ./mermaid.py ../examples/cwe_library.threatspec.json "../examples/${name}.threatspec.json" > "../examples/${name}.mermaid"
deactivate
popd

echo "Generating PNG using mermaid"
$MERMAID -w 1871 -i "${name}.mermaid"

echo "You can now view ${name}.mermaid.png"