#!/bin/sh
# For macOS with HomeBrew OpenSSL
OTP_VERSION=$1
OPENSSL_LOCAL="/opt/homebrew/opt/openssl@3"
INSTALL_DIR_PREFIX="/Users/kenji/otp/"
INSTALL_NAME=${OTP_VERSION}
#
env \
    CC=/usr/bin/clang \
    CXX=/usr/bin/clang++ \
    CFLAGS="-O3 -fstack-protector-strong" LDFLAGS="-fstack-protector-strong" \
    MAKEFLAGS="-j8" \
    OTP_GITHUB_URL="https://github.com/jj1bdx/otp/" \
    KERL_BUILD_DOCS="yes" \
    KERL_DOC_TARGETS="chunks" \
    KERL_BUILD_PLT="yes" \
    KERL_CONFIGURE_OPTIONS="--disable-dynamic-ssl-lib --enable-kernel-poll --enable-dirty-schedulers --disable-sctp --disable-sharing-preserving --without-javac --without-odbc --with-ssl=${OPENSSL_LOCAL}" \
    asdf install erlang ${OTP_VERSION}
