# Building local OpenSSL

* Specify the dependent library of OpenSSL at `${OPENSSL_LOCAL}` of each building script

## MacOS

* Use HomeBrew OpenSSL 1.1 `brew install openssl@1.1`

## Ubuntu

```sh
curl -LO https://www.openssl.org/source/openssl-1.1.1l.tar.gz
tar xvfz openssl-1.1.1l.tar.gz
cd openssl-1.1.1l
./config --prefix=/opt/openssl/1.1.1l
make
# install as root
sudo zsh
umask 022
make install
exit
```

## Reference

[installation memo of @voluntas](https://zenn.dev/voluntas/articles/erlang-source-code-install)
