# Building local OpenSSL

* Specify the dependent library of OpenSSL at `${OPENSSL_LOCAL}` of each building script
* Tested on OTP 25.1.2

## MacOS

* Use HomeBrew OpenSSL 1.1 for stable release: `brew install openssl@1.1`
* HomeBrew OpenSSL 3.0 is usable as well: `brew install openssl`

## Ubuntu

* Ubuntu 22.04.1 uses OpenSSL 3 as default
* To use the system OpenSSL 3, set `/usr/` to `$OPENSSL_LOCAL` for the Ubuntu build scripts 

### Manual installation of OpenSSL for Ubuntu

* OpenSSL 3.0.7 is usable (still partly experimental)
* Use OpenSSL 1.1.1s if any trouble occurs

```sh
# For OpenSSL 3.0.7
# You can build OpenSSL 1.1.1s with this script
# by rewriting "3.0.7 to "1.1.1s" in the following lines
curl -LO https://www.openssl.org/source/openssl-3.0.7.tar.gz
tar zxvf openssl-3.0.7.tar.gz
cd openssl-3.0.7
# use ./config for OpenSSL 1.1.1s
./Configure --prefix=/opt/openssl/3.0.7
make
# install as root
sudo zsh
umask 022
make install
exit
```

## Reference

[installation memo of @voluntas](https://zenn.dev/voluntas/articles/erlang-source-code-install)
