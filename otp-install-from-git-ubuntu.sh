#!/bin/sh
# For Ubuntu with a local OpenSSL
OTP_VERSION=$1
OPENSSL_LOCAL="/opt/openssl/3.0.7"
INSTALL_DIR_PREFIX="/home/kenji/otp/"
INSTALL_NAME=${OTP_VERSION}
env \
    CC=/usr/bin/cc \
    CXX=/usr/bin/c++ \
    CFLAGS="-O3 -fstack-protector-strong" LDFLAGS="-fstack-protector-strong" \
    MAKEFLAGS="-j12" \
    KERL_BUILD_DOCS="yes" \
    KERL_DOC_TARGETS="man html chunks" \
    KERL_BUILD_PLT="yes" \
    KERL_CONFIGURE_OPTIONS="--disable-debug --disable-silent-rules --enable-m64-build --disable-dynamic-ssl-lib --disable-hipe --disable-vm-probes --enable-kernel-poll --enable-dirty-schedulers --enable-sharing-preserving --enable-lock-counter --enable-esock --without-javac --without-odbc --enable-threads --enable-smp-support --with-wx --with-ssl=${OPENSSL_LOCAL}" \
    sh -c "(kerl build git https://github.com/jj1bdx/otp/ OTP-${OTP_VERSION} ${INSTALL_NAME} && kerl install ${INSTALL_NAME} ${INSTALL_DIR_PREFIX}${INSTALL_NAME})"
