# dot-kerlrc

Batch Configuration files for [kerl](https://github.com/kerl/kerl/).

## License

Public domain. See [UNLICENSE](UNLICENSE).

## compilation command set example

    kerl update releases
    kerl build 23.0 23.0
    kerl install 23.0 /home/kenji/otp/23.0

## For obtaining git release from GitHub Erlang/OTP archive

    # use the following `kerl build git` command
    kerl build git https://github.com/erlang/otp/ OTP-23.0 23.0

## Enforcing concurrency in `make`

    # set env variable MAKEFLAGS (see otp_build script)
    env MAKEFLAGS="-j8" kerl build 23.0 23.0-test

## On .kerlrc

I have removed individual .kerlrc files to encapsulate the execution environment inside the shell scripts. Use the shell scripts.

## Tips and caveats

* Since .kerlrc is a dot file for /bin/sh, exporting inside the environment will define the env variables
* The `export` commands will affect *your login environment* when activating curl!
* Rule of thumb: keep .kerlrc entries *all commented out* or use independent shell scripts

### On HiPE

* `--disable-hipe` flag is set since [HiPE support has been incomplete since 22.0](http://erlang.2086793.n4.nabble.com/HiPE-in-OTP-22-td4725613.html).

## Installation

### Use the latest OpenSSL (1.1.1)

See [OpenSSL.md](OpenSSL.md)

### macOS 10.14

* See [otp-build-from-git-macos.sh](otp-build-from-git-macos.sh)
* Update ccache to the latest version
* If build fails, try it again *without* ccache

```sh
    otp-build-from-git-macos.sh 23.0
    KERL_BUILD_DOCS="yes" kerl install 23.0 /Users/kenji/otp/23.0
```

### Ubuntu 20.04 LTS

* See [otp-build-from-git-ubuntu.sh](otp-build-from-git-ubuntu.sh)
* required packages: `build-essential libncurses5-dev autoconf libwxgtk3.0`
* required packages for building documentation: `xsltproc`

```sh
    otp-build-from-git-ubuntu.sh 23.0
    KERL_BUILD_DOCS="yes" kerl install 23.0 /home/kenji/otp/23.0
```

[End of README.md]
