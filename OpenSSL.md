# Building local OpenSSL

* Specify the dependent library of OpenSSL at `${OPENSSL_LOCAL}` of each building script

## MacOS

* HomeBrew: `brew install openssl`

## Ubuntu

* Ubuntu 24.04 uses OpenSSL 3 as default
* To use the system OpenSSL 3, set `/usr/` to `$OPENSSL_LOCAL` for the Ubuntu build scripts 

## Manual installation of OpenSSL for Ubuntu and other Linux distributions

* Use OpenSSL 3.6.2

```sh
# For OpenSSL 3.6.2
curl -LO https://github.com/openssl/openssl/releases/download/openssl-3.6.2/openssl-3.6.2.tar.gz
tar xvf openssl-3.6.2.tar.gz
cd openssl-3.6.2
./config --prefix=/opt/openssl/3.6.2 no-shared no-module
make -j
# install as root
sudo zsh
umask 022
make install_sw
exit
```

## Reference

[installation memo of @voluntas](https://zenn.dev/voluntas/articles/erlang-source-code-install)
