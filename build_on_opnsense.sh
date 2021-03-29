#!/bin/sh

# as root
pkg install gmake
pkg install automake
pkg install fping

# create smokeping user and su to smokeping user

curl -L --output smokeping-2.8.0pre.tar.gz https://github.com/prunux/SmokePing/archive/refs/tags/2.8.0pre.zip

curl -L --output add_lwp_protocol_https_thirdparty.patch https://github.com/prunux/SmokePing/pull/1.patch
curl -L --output fix_paranthesis_lib_smokeping.patch https://github.com/prunux/SmokePing/pull/2.patch

tar xzf smokeping-2.8.0pre.tar.gz
cd Smokeping-2.8.0pre

patch -p1 < ../add_lwp_protocol_https_thirdparty.patch
patch -p1 < ../fix_paranthesis_lib_smokeping.patch

# rebuild automconfigure and automake system
autoreconf -install --verbose --make

# install to user folder
./configure --prefix=$HOME/opt/smokeping-2.8.0pre
gmake
gmake install
