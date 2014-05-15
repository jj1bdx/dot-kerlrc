# kerl at k2r.org

For 17.0

## compilation command set example

     kerl update releases
     kerl build 17.0 17.0
     kerl install 17.0 /home/kenji/otp/r15b03-1/

## Enforcing concurrency in `make`

    # set env variable MAKEFLAGS (see otp_build script)
    env MAKEFLAGS="-j10" kerl build R16B03 r16b03-test

## .kerlrc

### NOTE VERY WELL

* Since .kerlrc is a dot file for /bin/sh, exporting inside the environment will define the env variables
* The `export` commands will affect *your login environment* when activating curl!
* Rule of thumb: keep .kerlrc entries *all commented out* or use independent shell scripts

### FreeBSD clang without .kerlrc with an independent shell script

    # with stack protector and dtrace options
    # note: multiple options in `CFLAGS` have to be specified in the environment
    env KERL_CONFIGURE_OPTIONS="--disable-native-libs \
                                --with-dynamic-trace=dtrace \
                                --with-ssl=/usr/local \
                                --with-javac \
                                --disable-hipe \
                                --enable-kernel-poll \
                                --with-wx-config=/usr/local/bin/wxgtk2u-2.8-config \
                                --without-odbc \
                                --enable-threads \
                                --enable-sctp \
                                --enable-smp-support" \
        CC=clang CXX=clang \
        CFLAGS="-g -O0 -fstack-protector" \
        LDFLAGS="-fstack-protector" \
    kerl build R16B02 clang-r16b02

### for FreeBSD 10.0-STABLE clang/gcc47 with .kerlrc embedded script

See `dot-kerlrc-freebsd`

### for Mac OS X 10.9.2

See `dot-kerlrc-osx` (Note: wxmac 3.0.0.0 works OK on the 64bit build)

### for Ubuntu 12.10 with systemtap (OLD)

    KERL_CONFIGURE_OPTIONS="--disable-native-libs --with-dynamic-trace=systemtap --disable-hipe --enable-kernel-poll --enable-m64-build --without-odbc --enable-threads --enable-sctp --enable-smp-support"

