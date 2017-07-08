# dot-kerlrc

Configuration file `.kerlrc` for [kerl](https://github.com/kerl/kerl/).

## License

Public domain. See `UNLICENSE`.

## compilation command set example

    kerl update releases
    kerl build 20.0 20.0
    kerl install 20.0.1 /home/kenji/otp/20.0.1

## For obtaining git release from GitHub Erlang/OTP archive

    # use the following `kerl build git` command
    kerl build git https://github.com/erlang/otp/ OTP-19.1.1 19.1.1

## Enforcing concurrency in `make`

    # set env variable MAKEFLAGS (see otp_build script)
    env MAKEFLAGS="-j8" kerl build 19.1 19.1-test

## On .kerlrc

I have removed individual .kerlrc files so that I can fix the execution environment inside the shell scripts. Use the shell scripts.

### for FreeBSD 11.0-STABLE

* See `otp-build-from-git-freebsd.sh`
* Use `clang`

### for macOS 10.12

* See `otp-build-from-git-macos.sh`
* Use OpenSSL in homebrew at `/usr/local/opt/openssl`
* Java required when using JDK: see <https://support.apple.com/kb/DL1572> for OS X 10.11 or older, download directly from Oracle's site for macOS 10.12 and later
* Update ccache to the latest version
* If build fails, try it again *without* ccache

### NOTE VERY WELL

* Since .kerlrc is a dot file for /bin/sh, exporting inside the environment will define the env variables
* The `export` commands will affect *your login environment* when activating curl!
* Rule of thumb: keep .kerlrc entries *all commented out* or use independent shell scripts
