# dot-kerlrc

Batch Configuration files for [kerl](https://github.com/kerl/kerl/).

## License

Public domain. See `UNLICENSE`.

## compilation command set example

    kerl update releases
    kerl build 21.0 21.0
    kerl install 21.0.1 /home/kenji/otp/21.0.1

## For obtaining git release from GitHub Erlang/OTP archive

    # use the following `kerl build git` command
    kerl build git https://github.com/erlang/otp/ OTP-21.0.1 21.0.1

## Enforcing concurrency in `make`

    # set env variable MAKEFLAGS (see otp_build script)
    env MAKEFLAGS="-j8" kerl build 21.0 21.0-test

## On .kerlrc

I have removed individual .kerlrc files so that I can fix the execution environment inside the shell scripts. Use the shell scripts.

## for FreeBSD 11.2-STABLE

* See `otp-build-from-git-freebsd.sh`
* Use `clang`

## for macOS 10.13.5

* See `otp-build-from-git-macos.sh`
* Use OpenSSL in homebrew at `/usr/local/opt/openssl`
* Update ccache to the latest version
* If build fails, try it again *without* ccache

## for Ubuntu 18.04 LTS (Bionic)

### OpenSSL 1.1.1

(From [installation memo of @voluntas](https://gist.github.com/voluntas/303d0ca6cfe3869497a8da37f143f946))

```
curl -LO https://www.openssl.org/source/openssl-1.1.1.tar.gz
tar xvfz openssl-1.1.1.tar.gz
cd openssl-1.1.1
./config --prefix=/opt/openssl/1.1.1
make
sudo zsh
umask 022
make install
exit
```

### Other required packages

* See `otp-build-from-git-ubuntu.sh`
* Install OpenSSL at `/opt/openssl/1.1.1`
* required packages: `build-essential libncurses5-dev autoconf libwxgtk3.0-dev`

## NOTE VERY WELL

* Since .kerlrc is a dot file for /bin/sh, exporting inside the environment will define the env variables
* The `export` commands will affect *your login environment* when activating curl!
* Rule of thumb: keep .kerlrc entries *all commented out* or use independent shell scripts
