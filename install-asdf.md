# How to install asdf

## Remove kiex

* `kiex implode`
* Remove kiex scripts

## Download asdf

```
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
```

## Add zsh setup

* After cargo setup
* Before user-based PATH

```
. "${HOME}/.asdf/asdf.sh"
```

## Add plugins

```
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
```

## Install Erlang

* Use `asdf-install-otp-macos.sh OTP_VERSION` or
* Use `asdf-install-otp-ubuntu.sh OTP_VERSION`

## Set Erlang version

* `asdf global erlang 27.0.1`

## Install Elixir

* For 1.17.2 with OTP 27: `asdf install elixir 1.17.2-otp-27`

## Set Elixir version

* `asdf global elixir 1.17.2-otp-27`

[End of document]
