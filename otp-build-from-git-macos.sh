#!/bin/sh
# For macOS with HomeBrew OpenSSL
OTP_VERSION=$1
OPENSSL_LOCAL="/usr/local/opt/openssl@1.1"
INSTALL_DIR_PREFIX="/Users/kenji/otp/"
#
env \
    CC=/usr/local/opt/ccache/libexec/clang \
    CXX=/usr/local/opt/ccache/libexec/clang++ \
    CFLAGS="-O3 -fstack-protector-strong" LDFLAGS="-fstack-protector-strong" \
    MAKEFLAGS="-j12" \
    KERL_BUILD_PLT="yes" \
    KERL_CONFIGURE_OPTIONS="--disable-hipe --enable-m64-build --enable-darwin-64bit --disable-vm-probes --disable-native-libs --enable-kernel-poll --enable-dirty-schedulers --enable-sharing-preserving --enable-lock-counter --enable-esock --disable-sctp --without-javac --without-odbc --enable-threads --enable-smp-support --with-wx --with-ssl=${OPENSSL_LOCAL} --disable-silent-rules --disable-dynamic-ssl-lib" \
    KERL_BUILD_DOCS="yes" \
    kerl build git https://github.com/jj1bdx/otp/ OTP-${OTP_VERSION} ${OTP_VERSION} && \
    kerl install ${OTP_VERSION} ${INSTALL_DIR_PREFIX}${OTP_VERSION}
