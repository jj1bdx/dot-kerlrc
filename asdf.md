# How to install asdf

## Remove kiex

* `kiex implode`
* Remove kiex scripts

## macOS Homebrew

brew install asdf

## For Linux

Use local compilation.
See [the manual section of installation](https://asdf-vm.com/guide/getting-started.html#_1-install-asdf) for the further details.

```sh
# Clone the latest version
git clone https://github.com/asdf-vm/asdf.git --branch v0.16.4
cd asdf
make
````

## Add zsh setup

```sh
# asdf
export ASDF_DATA_DIR="${HOME}/.asdf"
export PATH="${ASDF_DATA_DIR}/shims:$PATH"
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

* `asdf set erlang 27.2.4`

## Install Elixir

* For 1.18.2 with OTP 27: `asdf install elixir 1.18.2-otp-27`

## Set Elixir version

* `asdf set elixir 1.18.2-otp-27`

## Removing old Erlang installations

* `asdf uninstall` doesn't work well
* Explicitly remove the directory with: `rm -f ~/.asdf/installs/erlang/OTP_VERSION`

[End of document]
