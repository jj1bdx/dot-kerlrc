# dot-kerlrc

Batch Configuration files for [kerl](https://github.com/kerl/kerl/).

## License

Public domain. See [UNLICENSE](UNLICENSE).

## Disclaimer

* No guarantee.
* The compilation flags and other build parameters may change without notice.
## compilation command set example

    kerl update releases
    kerl build 27.0 27.0
    kerl install 27.0 /home/kenji/otp/27.0

## For obtaining git release from GitHub Erlang/OTP archive

    # use the following `kerl build git` command
    kerl build git https://github.com/erlang/otp/ OTP-27.0 27.0

## Enforcing concurrency in `make`

    # set env variable MAKEFLAGS (see otp_build script)
    env MAKEFLAGS="-j8" kerl build 27.0 27.0-test

## On .kerlrc

I have removed individual .kerlrc files to encapsulate the execution environment inside the shell scripts. Use the shell scripts.

## Tips and caveats

* Since .kerlrc is a dot file for /bin/sh, exporting inside the environment will define the env variables
* The `export` commands will affect *your login environment* when activating curl!
* Rule of thumb: keep .kerlrc entries *all commented out* or use independent shell scripts

# Installation

* See [OpenSSL.md](OpenSSL.md)
* See also [asdf.md](asdf.md)

### macOS

* See [otp-build-from-git-macos.sh](otp-build-from-git-macos.sh)
* Update ccache to the latest version
* If build fails, try it again *without* ccache

```sh
    otp-build-from-git-macos.sh 27.0
    env KERL_BUILD_PLT="yes" KERL_BUILD_DOCS="yes" \
  	kerl install 27.0 /Users/kenji/otp/27.0
```

### Ubuntu 24.04 LTS

* See [otp-build-from-git-ubuntu.sh](otp-build-from-git-ubuntu.sh)
* required packages: `build-essential libncurses5-dev autoconf libwxgtk3.0`
* required packages for building documentation: `xsltproc`

```sh
    otp-build-from-git-ubuntu.sh 27.0
    env KERL_BUILD_PLT="yes" KERL_BUILD_DOCS="yes" \
  	kerl install 27.0 /home/kenji/otp/27.0
```

## Other scripts

* fetch-github-elixir.sh: update local copy of Elixir repository
* fetch-github-otp.sh: update local copy of Erlang/OTP repository

[End of README.md]
