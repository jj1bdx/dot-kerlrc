# Building local OpenSSL

* Specify the dependent library of OpenSSL at `${OPENSSL_LOCAL}` of each building script
* Tested on OTP 28.1

## MacOS

* HomeBrew: `brew install openssl`

## Ubuntu

* Ubuntu 24.04 uses OpenSSL 3 as default
* To use the system OpenSSL 3, set `/usr/` to `$OPENSSL_LOCAL` for the Ubuntu build scripts 

### Manual installation of OpenSSL for Ubuntu

* Use OpenSSL 3.5.3 

```sh
# For OpenSSL 3.5.3
curl -LO https://github.com/openssl/openssl/releases/download/openssl-3.5.3/openssl-3.5.3.tar.gz
tar xvf openssl-3.5.3.tar.gz
cd openssl-3.5.3
./config --prefix=/opt/openssl/3.5.3 no-shared no-module
make -j
# install as root
sudo zsh
umask 022
make install_sw
exit
```

## Reference

[installation memo of @voluntas](https://zenn.dev/voluntas/articles/erlang-source-code-install)
