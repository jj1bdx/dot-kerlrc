# dot-kerlrc

Batch Configuration files for [kerl](https://github.com/kerl/kerl/).

## License

Public domain. See [UNLICENSE](UNLICENSE).

## compilation command set example

    kerl update releases
    kerl build 21.1 21.1
    kerl install 21.1 /home/kenji/otp/21.1

## For obtaining git release from GitHub Erlang/OTP archive

    # use the following `kerl build git` command
    kerl build git https://github.com/erlang/otp/ OTP-21.1 21.1

## Enforcing concurrency in `make`

    # set env variable MAKEFLAGS (see otp_build script)
    env MAKEFLAGS="-j8" kerl build 21.0 21.0-test

## On .kerlrc

I have removed individual .kerlrc files so that I can fix the execution environment inside the shell scripts. Use the shell scripts.

## Tips and caveats

* Since .kerlrc is a dot file for /bin/sh, exporting inside the environment will define the env variables
* The `export` commands will affect *your login environment* when activating curl!
* Rule of thumb: keep .kerlrc entries *all commented out* or use independent shell scripts

## Installation

### Use the latest OpenSSL (1.1.1)

See [OpenSSL.md](OpenSSL.md)

### FreeBSD 11.2-STABLE

* See `otp-build-from-git-freebsd.sh`
* Use `clang`

### macOS 10.14

* See `otp-build-from-git-macos.sh`
* Update ccache to the latest version
* If build fails, try it again *without* ccache

### Ubuntu 18.04 LTS

* See `otp-build-from-git-ubuntu.sh`
* required packages: `build-essential libncurses5-dev autoconf libwxgtk3.0-dev`

