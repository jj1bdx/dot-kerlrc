#!/bin/sh
# For macOS with HomeBrew OpenSSL
OTP_VERSION=$1
env \
    CC=/usr/local/opt/ccache/libexec/cc \
    CXX=/usr/local/opt/ccache/libexec/cc \
    CFLAGS="-O3 -fstack-protector-strong" LDFLAGS="-fstack-protector-strong" \
    MAKEFLAGS="-j2" \
    KERL_BUILD_PLT="yes" \
    KERL_CONFIGURE_OPTIONS="CC=/usr/local/opt/ccache/libexec/cc CXX=/usr/local/opt/ccache/libexec/c++ --enable-m64-build --enable-darwin-64bit --enable-hipe --enable-vm-probes --with-dynamic-trace=dtrace --disable-native-libs --enable-kernel-poll --without-odbc --enable-threads --enable-smp-support --with-wx --with-ssl=/usr/local/opt/openssl --disable-silent-rules --enable-dynamic-ssl-lib --enable-shared-zlib" \
    kerl build git https://github.com/jj1bdx/otp/ OTP-${OTP_VERSION} ${OTP_VERSION}
