# dot-kerlrc

Configuration file `.kerlrc` for [kerl](https://github.com/kerl/kerl/).

## License

Public domain. See `UNLICENSE`.

## compilation command set example

    kerl update releases
    kerl build 19.1 19.1
    kerl install 19.1 /home/kenji/otp/19.1

## For obtaining git release from GitHub Erlang/OTP archive

    # use the following `kerl build git` command
    kerl build git https://github.com/erlang/otp/ OTP-19.1.1 19.1.1

## Enforcing concurrency in `make`

    # set env variable MAKEFLAGS (see otp_build script)
    env MAKEFLAGS="-j8" kerl build 19.1 19.1-test

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
    kerl build 19.1 19.1

### for FreeBSD 11.0-STABLE

* See `dot-kerlrc-freebsd`
* Use `clang`

### for macOS 10.12

* See `dot-kerlrc-osx`
* Use `clang`
* Use OpenSSL in homebrew at `/usr/local/opt/openssl`
* Java required when using JDK: see <https://support.apple.com/kb/DL1572> for OS X 10.11 or older, download directly from Oracle's site for macOS 10.12 and later
* Update ccache to the latest version
* If build fails, try it again *without* ccache

