#!/bin/sh
# For macOS with HomeBrew OpenSSL
OTP_VERSION=$1
OPENSSL_LOCAL="/usr/local/opt/openssl@3"
INSTALL_DIR_PREFIX="/Users/kenji/otp/"
INSTALL_NAME=${OTP_VERSION}
#
env \
    CC=/usr/bin/clang \
    CXX=/usr/bin/clang++ \
    CFLAGS="-O3 -fstack-protector-strong" LDFLAGS="-fstack-protector-strong" \
    MAKEFLAGS="-j12" \
    KERL_BUILD_DOCS="yes" \
    KERL_BUILD_PLT="yes" \
    KERL_CONFIGURE_OPTIONS="--disable-debug --disable-silent-rules --enable-darwin-64bit --enable-dynamic-ssl-lib --disable-hipe --enable-vm-probes --with-dynamic-trace=dtrace --enable-kernel-poll --enable-dirty-schedulers --enable-sharing-preserving --enable-lock-counter --enable-esock --without-javac --without-odbc --enable-threads --enable-smp-support --with-wx --with-ssl=${OPENSSL_LOCAL}" \
    sh -c "(kerl build git https://github.com/jj1bdx/otp/ OTP-${OTP_VERSION} ${INSTALL_NAME} && kerl install ${INSTALL_NAME} ${INSTALL_DIR_PREFIX}${INSTALL_NAME})"
