#!/bin/sh
# For Ubuntu with custom OpenSSL
# required packages: build-essential libncurses5-dev autoconf libwxgtk3.0-dev
# required packages for documentation: xsltproc fop libxml2-utils
OTP_VERSION=$1
env \
    CC=/usr/lib/ccache/cc \
    CXX=/usr/lib/ccache/cc \
    CFLAGS="-O3 -fstack-protector-strong" LDFLAGS="-fstack-protector-strong" \
    MAKEFLAGS="-j2" \
    KERL_BUILD_PLT="yes" \
    KERL_CONFIGURE_OPTIONS="--enable-kernel-poll --enable-hipe --enable-dirty-schedulers --enable-sharing-preserving --enable-lock-counter --disable-sctp --disable-dynamic-ssl-lib --with-ssl=/opt/openssl/1.1.0h --without-javac --without-odbc --disable-silent-rules --with-wx-config=/usr/bin/wx-config" \
    kerl build git https://github.com/jj1bdx/otp/ OTP-${OTP_VERSION} ${OTP_VERSION}
