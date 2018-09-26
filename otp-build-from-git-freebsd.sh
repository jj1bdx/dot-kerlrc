#!/bin/sh
OTP_VERSION=$1
OPENSSL_LOCAL="/home/kenji/openssl/1.1.1"
# For FreeBSD 10.x and 11.x
# see <https://svnweb.freebsd.org/ports/head/lang/erlang-runtime19/Makefile?r1=420350&r2=420841> for the MAP_NORESERVE flag
###
# build with dtrace
env \
    CC=clang CXX=clang \
    CFLAGS="-O3 -fstack-protector-strong -DMAP_NORESERVE=0" \
    LDFLAGS="-fstack-protector-strong" \
    MAKEFLAGS="-j2" \
    KERL_BUILD_PLT="yes" \
    KERL_CONFIGURE_OPTIONS="--enable-m64-build --disable-native-libs --enable-vm-probes --with-dynamic-trace=dtrace --with-ssl=${OPENSSL_LOCAL} --enable-hipe --enable-kernel-poll --enable-dirty-schedulers --enable-sharing-preserving --enable-lock-counter --disable-sctp --with-wx-config=/usr/local/bin/wxgtk2u-2.8-config --without-javac --without-odbc --enable-threads --enable-smp-support --disable-silent-rules" \
    kerl build git https://github.com/jj1bdx/otp/ OTP-${OTP_VERSION} ${OTP_VERSION}-dtrace
###
# build without dtrace
env \
    CC=clang CXX=clang \
    CFLAGS="-O3 -fstack-protector-strong -DMAP_NORESERVE=0" \
    LDFLAGS="-fstack-protector-strong" \
    MAKEFLAGS="-j2" \
    KERL_BUILD_PLT="yes" \
    KERL_CONFIGURE_OPTIONS="--enable-m64-build --disable-native-libs --disable-vm-probes --with-ssl=${OPENSSL_LOCAL} --enable-hipe --enable-kernel-poll --enable-dirty-schedulers --enable-sharing-preserving --enable-lock-counter --disable-sctp --with-wx-config=/usr/local/bin/wxgtk2u-2.8-config --without-javac --without-odbc --enable-threads --enable-smp-support --disable-silent-rules" \
    kerl build git https://github.com/jj1bdx/otp/ OTP-${OTP_VERSION} ${OTP_VERSION}
