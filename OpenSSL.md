# Building local OpenSSL

* Specify the dependent library of OpenSSL at `${OPENSSL_LOCAL}` of each building script
* Tested on OTP 24.3.4 and 25.0

## MacOS

* Use HomeBrew OpenSSL 1.1 for stable release: `brew install openssl@1.1`
* HomeBrew OpenSSL 3.0 is usable as well: `brew install openssl`

## Ubuntu

* Ubuntu 22.04 uses OpenSSL 3 as default
* To use the system OpenSSL 3, set `/usr/` to `$OPENSSL_LOCAL` for the Ubuntu build scripts 

### Manual installation of OpenSSL for Ubuntu

* Use OpenSSL 1.1.1o for the stable release
* OpenSSL 3.0.3 is also usable (experimental)

```sh
# For OpenSSL 1.1.1o
# You can build OpenSSL 3.0.3 with this script
# by rewriting "1.1.1o" to "3.0.3" in the following lines
curl -LO https://www.openssl.org/source/openssl-1.1.1o.tar.gz
tar zxvf openssl-1.1.1o.tar.gz
cd openssl-1.1.1o
./config --prefix=/opt/openssl/1.1.1o
make
# install as root
sudo zsh
umask 022
make install
exit
```

## Reference

[installation memo of @voluntas](https://zenn.dev/voluntas/articles/erlang-source-code-install)
