#!/usr/bin/env bash

declare -A MAP;

MAP=(
    ["bash"]="5.0.17"
    ["cmake"]="3.17.3"
)

for KEY in ${!MAP[@]};
do
    if [ $(brew info $KEY | head -n 1 | perl -nle 'print $& while m{[\d.]+}g') = ${MAP[$KEY]} ]; then
	echo "${KEY} is latest"
    else
	echo "let's install new ${KEY}"
    fi
done
