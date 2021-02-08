#!/bin/bash

dirs=("$@")
i=0
executable=()
for d in ${dirs[@]}; do
    jars=($(ls $d | grep '.jar$'))
    for jar in ${jars[@]}; do
	mkdir -p tmp
	pushd tmp > /dev/null
	jar -xf ../$d/$jar META-INF/MANIFEST.MF
	if grep -q "^Main-Class: " META-INF/MANIFEST.MF; then
	    executable+=("$d/$jar")
	fi
	popd > /dev/null
    done
    if [ ${#jars[@]} -gt 0 ]; then
	break
    fi
    let i++
done
echo ${executable[0]}
