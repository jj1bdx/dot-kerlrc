#!/bin/sh
# For macOS with HomeBrew OpenSSL
OTP_VERSION=$1
OPENSSL_LOCAL="/usr/local/opt/openssl@1.1"
INSTALL_DIR_PREFIX="/Users/kenji/otp/"
INSTALL_NAME=${OTP_VERSION}
#
#local autoconf hack for building Erlang/OTP 24.0
#Add
#   PATH="/Users/kenji/bin/autoconf-2.69/bin:${PATH}" \
# 
env \
    CC=/usr/bin/clang \
    CXX=/usr/bin/clang++ \
    CFLAGS="-O3 -fstack-protector-strong" LDFLAGS="-fstack-protector-strong" \
    MAKEFLAGS="-j12" \
    KERL_BUILD_PLT="yes" \
    KERL_CONFIGURE_OPTIONS="--enable-m64-build --enable-darwin-64bit --disable-hipe --enable-vm-probes --with-dynamic-trace=dtrace --disable-native-libs --enable-kernel-poll --enable-dirty-schedulers --enable-sharing-preserving --enable-lock-counter --enable-esock --disable-sctp --without-javac --without-odbc --enable-threads --enable-smp-support --with-wx --with-ssl=${OPENSSL_LOCAL} --disable-silent-rules --disable-dynamic-ssl-lib" \
    KERL_BUILD_DOCS="yes" \
    sh -c "(kerl build git https://github.com/jj1bdx/otp/ OTP-${OTP_VERSION} ${INSTALL_NAME} && kerl install ${INSTALL_NAME} ${INSTALL_DIR_PREFIX}${INSTALL_NAME})"
