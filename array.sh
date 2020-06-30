#!/bin/bash
#
# for centos7
#

echo "[openresty]
name=Official OpenResty Open Source Repository for CentOS
baseurl=https://openresty.org/package/centos/$releasever/$basearch
skip_if_unavailable=False
gpgcheck=1
repo_gpgcheck=0
gpgkey=https://openresty.org/package/pubkey.gpg
enabled=1
enabled_metadata=1" > /etc/yum.repos.d/openresty.repo

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
