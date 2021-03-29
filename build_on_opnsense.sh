#!/bin/sh

# as root
pkg install gmake
pkg install fping

# create smokeping user and su to smokeping user

curl -O smokeping-2.8.0pre.tar.gz  https://github.com/prunux/SmokePing/archive/refs/tags/2.8.0pre.zip

curl -O add_lwp_protocol_https_thirdparty.patch https://github.com/prunux/SmokePing/pull/1.patch
curl -O fix_paranthesis_lib_smokeping.patch https://github.com/prunux/SmokePing/pull/2.patch

patch -p0 < add_lwp_protocol_https_thirdparty.patch
patch -p0 < fix_paranthesis_lib_smokeping.patch

