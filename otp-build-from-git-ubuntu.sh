#!/bin/sh
# For Ubuntu with a local OpenSSL
OTP_VERSION=$1
OPENSSL_LOCAL="/opt/openssl/3.1.3"
INSTALL_DIR_PREFIX="/home/kenji/otp/"
INSTALL_NAME=${OTP_VERSION}
#
env \
    CC=/usr/bin/cc \
    CXX=/usr/bin/c++ \
    CFLAGS="-O3 -fstack-protector-strong" LDFLAGS="-fstack-protector-strong" \
    MAKEFLAGS="-j" \
    KERL_BUILD_DOCS="yes" \
    KERL_DOC_TARGETS="man html chunks" \
    KERL_BUILD_PLT="yes" \
    KERL_CONFIGURE_OPTIONS="--disable-dynamic-ssl-lib --enable-kernel-poll --enable-dirty-schedulers --disable-sctp --disable-sharing-preserving --without-javac --without-odbc --with-ssl=${OPENSSL_LOCAL}" \
    sh -c "(kerl build git https://github.com/jj1bdx/otp/ OTP-${OTP_VERSION} ${INSTALL_NAME})"
