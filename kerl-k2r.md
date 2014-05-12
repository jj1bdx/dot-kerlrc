# kerl at k2r.org

Note: examples here are old, though still applicable for Erlang/OTP 17.0 and later.

## compilation command set example

     kerl update releases
     (umask 0022 && kerl build R15B03-1 r15b03-1)
     (umask 0022 && kerl install r15b03-1 /home/kenji/otp/r15b03-1/)

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

### FreeBSD clang/gcc46 with .kerlrc embedded script

    # since .kerl is a dot file for /bin/sh, exporting inside the environment will define the env variables
    # for clang
    #export CC=clang CXX=clang CFLAGS="-g -O0 -fstack-protector" LDFLAGS="-fstack-protector"
    export CC=clang CXX=clang CFLAGS="-g -O3 -fstack-protector" LDFLAGS="-fstack-protector"
    # for gcc46
    #export CC=gcc46 CXX=gcc46 CFLAGS="-g -O3 -fomit-frame-pointer -fstack-protector" LDFLAGS="-fstack-protector"
    # compilation options
    #KERL_CONFIGURE_OPTIONS="--disable-native-libs --enable-vm-probes --with-dynamic-trace=dtrace --with-ssl=/usr/local --with-javac --disable-hipe --enable-kernel-poll --with-wx-config=/usr/local/bin/wxgtk2u-2.8-config --without-odbc --enable-threads --enable-sctp --enable-smp-support"
    KERL_CONFIGURE_OPTIONS="--disable-native-libs --enable-vm-probes --with-dynamic-trace=dtrace --with-ssl=/usr/local --with-javac --enable-hipe --enable-kernel-poll --with-wx-config=/usr/local/bin/wxgtk2u-2.8-config --without-odbc --enable-threads --enable-sctp --enable-smp-support"

### for Mac OS X 10.8.5

    KERL_CONFIGURE_OPTIONS="--enable-darwin-64bit --disable-hipe --enable-vm-probes --with-dynamic-trace=dtrace --disable-native-libs --enable-kernel-poll --without-odbc --enable-threads --enable-smp-support"

### for Mac OS X 10.8.5 with gcc-4.7 and without wx

    KERL_CONFIGURE_OPTIONS="CC=/usr/local/bin/gcc-4.7 CXX=/usr/local/bin/g++-4.7 --enable-darwin-64bit --disable-hipe --enable-vm-probes --with-dynamic-trace=dtrace --disable-native-libs --enable-kernel-poll --without-odbc --enable-threads --enable-smp-support --without-wx"

* Note: wxmac 2.9.5.0 does not work for the time being (2.9.4.0 partially works)
* See (on homebrew Erlang R16B and wxmac) https://github.com/mxcl/homebrew/issues/18291
* See also (on homebrew wxmac) https://github.com/mxcl/homebrew/issues/22732

### for FreeBSD 9-STABLE with DTrace

    KERL_CONFIGURE_OPTIONS="CC=gcc46 CXX=g++46 --disable-native-libs --with-dynamic-trace=dtrace --with-ssl=/usr/local --with-javac --disable-hipe --enable-kernel-poll --with-wx-config=/usr/local/bin/wxgtk2u-2.8-config --without-odbc --enable-threads --enable-sctp --enable-smp-support"

### for Ubuntu 12.10 with systemtap

    KERL_CONFIGURE_OPTIONS="--disable-native-libs --with-dynamic-trace=systemtap --disable-hipe --enable-kernel-poll --enable-m64-build --without-odbc --enable-threads --enable-sctp --enable-smp-support"

### Enforcing concurrency in `make`

    # set env variable MAKEFLAGS (see otp_build script)
    env MAKEFLAGS="-j10" kerl build R16B03 r16b03-test
