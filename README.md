# dot-kerlrc

Configuration file `.kerlrc` for [kerl](https://github.com/spawngrid/kerl).

## compilation command set example

     kerl update releases
     kerl build 17.3 17.3
     kerl install 17.3 /home/kenji/otp/17.3

## Enforcing concurrency in `make`

    # set env variable MAKEFLAGS (see otp_build script)
    env MAKEFLAGS="-j8" kerl build 17.3 17.3-test

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
    kerl build 17.3 17.3

### for FreeBSD 10.1-STABLE

* See `dot-kerlrc-freebsd`
* Use `clang`

### for Mac OS X 10.10

* See `dot-kerlrc-osx`
* Use `gcc-4.8` in HomeBrew

