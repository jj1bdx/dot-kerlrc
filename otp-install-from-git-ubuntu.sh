#!/bin/sh
# For Ubuntu with custom OpenSSL
# required packages: build-essential libncurses5-dev autoconf libwxgtk3.0-dev
# required packages for documentation: xsltproc fop libxml2-utils
INSTALL_DIR_PREFIX=/home/kenji/otp/
OTP_VERSION=$1
OPENSSL_LOCAL=/opt/openssl/1.1.1l
env \
    CC=/usr/lib/ccache/gcc \
    CXX=/usr/lib/ccache/g++ \
    CFLAGS="-O3 -fstack-protector-strong" LDFLAGS="-fstack-protector-strong" \
    MAKEFLAGS="-j12" \
    KERL_BUILD_PLT="yes" \
    KERL_CONFIGURE_OPTIONS="--disable-hipe --disable-vm-probes --disable-native-libs --enable-kernel-poll --enable-dirty-schedulers --enable-sharing-preserving --enable-lock-counter --enable-esock --disable-sctp --without-javac --without-odbc --enable-threads --enable-smp-support --with-wx --with-ssl=${OPENSSL_LOCAL} --disable-silent-rules --disable-dynamic-ssl-lib" \
    KERL_BUILD_DOCS="yes" \
    sh -c "(kerl build git https://github.com/jj1bdx/otp/ OTP-${OTP_VERSION} ${OTP_VERSION} && kerl install ${OTP_VERSION} ${INSTALL_DIR_PREFIX}${OTP_VERSION})"
