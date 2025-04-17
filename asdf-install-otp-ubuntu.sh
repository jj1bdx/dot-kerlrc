#!/bin/sh
# For Ubuntu with a local OpenSSL
OTP_VERSION=$1
OPENSSL_LOCAL="/opt/openssl/3.5.0"
INSTALL_DIR_PREFIX="/home/kenji/otp/"
INSTALL_NAME=${OTP_VERSION}
#
env \
    CC=/usr/bin/cc \
    CXX=/usr/bin/c++ \
    CFLAGS="-O3 -fstack-protector-strong" LDFLAGS="-fstack-protector-strong" \
    MAKEFLAGS="-j8" \
    OTP_GITHUB_URL="https://github.com/jj1bdx/otp/" \
    KERL_BUILD_DOCS="yes" \
    KERL_DOC_TARGETS="chunks" \
    KERL_BUILD_PLT="yes" \
    KERL_CONFIGURE_OPTIONS="--disable-dynamic-ssl-lib --enable-kernel-poll --enable-dirty-schedulers --disable-sctp --disable-sharing-preserving --without-javac --without-odbc --with-ssl=${OPENSSL_LOCAL} --with-wx-config=/usr/bin/wx-config" \
    asdf install erlang ${OTP_VERSION}
