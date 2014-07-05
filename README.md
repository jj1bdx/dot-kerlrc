# dot-kerlrc

Configuration file `.kerlrc` for [kerl](https://github.com/spawngrid/kerl).

## compilation command set example

     kerl update releases
     kerl build 17.1 17.1
     kerl install 17.1 /home/kenji/otp/17.1

## Enforcing concurrency in `make`

    # set env variable MAKEFLAGS (see otp_build script)
    env MAKEFLAGS="-j10" kerl build 17.1 17.1-test

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
    kerl build 17.1 17.1

### for FreeBSD 10.0-STABLE clang/gcc47 with .kerlrc embedded script

See `dot-kerlrc-freebsd`

### for Mac OS X 10.9.4

See `dot-kerlrc-osx`. Note: wxmac 3.0.1.0 works OK on the 64bit build, You need
to recompile the erlang distribution and relink the wx library if the wxmac is
upgraded to a new version.

### for Ubuntu 12.10 with systemtap (OLD)

    KERL_CONFIGURE_OPTIONS="--disable-native-libs --with-dynamic-trace=systemtap --disable-hipe --enable-kernel-poll --enable-m64-build --without-odbc --enable-threads --enable-sctp --enable-smp-support"

