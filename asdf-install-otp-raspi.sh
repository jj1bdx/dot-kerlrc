#!/bin/sh
# General build options
OTP_VERSION=$1
OPENSSL_LOCAL="/opt/openssl/3.4.1"
CONFIGURE_OPTIONS=" \
  --with-ssl=${OPENSSL_LOCAL} \
  --enable-kernel-poll \
  --enable-dirty-schedulers \
  --enable-jit \
  --disable-sctp \
  --disable-dynamic-ssl-lib \
  --disable-sharing-preserving \
  --without-javac \
  --without-odbc \
  --without-wx \
  --without-debugger \
  --without-observer \
  --without-crashdump_viewer \
  --without-et \
  --without-tftp \
  --without-ftp \
  --without-megaco \
  --without-eldap \
  --without-diameter \
  --without-jinterface \
  " 
INSTALL_DIR_PREFIX="/home/kenji/otp/"
INSTALL_NAME=${OTP_VERSION}
#
#WXCONFIG_LOCAL="/opt/wx-3.2/bin/wx-config"
#CONFIGURE_OPTION_WX="--with-wx-config=${WXCONFIG_LOCAL}"
#
env \
    CC=/usr/bin/cc \
    CXX=/usr/bin/c++ \
    CFLAGS="-O3 -fstack-protector-strong" \
    LDFLAGS="-fstack-protector-strong" \
    MAKEFLAGS="-j$(nproc)" \
    OTP_GITHUB_URL="https://github.com/jj1bdx/otp/" \
    KERL_BUILD_DOCS="yes" \
    KERL_DOC_TARGETS="chunks" \
    KERL_BUILD_PLT="yes" \
    KERL_CONFIGURE_OPTIONS="${CONFIGURE_OPTIONS}" \
    asdf install erlang ${OTP_VERSION}
