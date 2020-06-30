#!/bin/bash
#
# for centos7
#

declare -a packages=(
    "openresty-1.15.8.3-1.el7.x86_64"
    "python-2.7.5-88.el7.x86_64"
)

for e in ${packages[@]}; do
    if [ -n "$(repoquery ${e})" ]; then
	echo "${e}.rpm  ok"
    else
	echo "${e}.rpm  no"
    fi
done
