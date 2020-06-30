#!/bin/bash

declare -a packages=(
    "openresty-1.15.8.3-1.el7.x86_64"
    "openresty-pcre-8.44-1.el7.x86_64"
    "openresty-zlib-1.2.11-3.el7.centos.x86_64"
)

for e in ${packages[@]}; do
    if [ -n $(repoquery ${e}) ]; then
	echo "already exist ${e}.rpm"
    else
	echo "no ${e}.rpm"
    fi
done
