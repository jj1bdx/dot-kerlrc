# Building local wxWidgets

## MacOS

* Use HomeBrew for 3.1.6: `brew install wxwidgets`

## Ubuntu 22.04

For using system wxWidgets 3.0:

```
sudo apt install \
  libwxgtk-webview3.0-gtk3-dev libwxgtk-media3.0-gtk3-dev \
  libwxgtk3.0-gtk3-dev
```

### Manual build

* Download the source code from <https://www.wxwidgets.org/downloads/>
* OTP 25.0 can compile with wxWidgets-3.1.6.0 wxGTK as they are
  - See wxwidgets3.1-k2r-configure.sh for the building options
    - Disable compat28 by not specifying `--enable-compat28`
  - See https://github.com/erlang/otp/issues/6022 for the details
  - See https://github.com/erlang/otp/pull/6023 for the workaround
* OTP 25.0 can compile with wxWidgets-3.0.5 wxGTK
  - See wxwidgets3.0-k2r-configure.sh for the building options
* To use locally-built wxGTK, set the following kerl configuration option to the appropriate `wx-config`
  - example: `--with-wx-config=/opt/wx-3.0/bin/wx-config`
  - Note well: to use the shared library, add the path to `LD_LIBRARY_PATH`, otherwise the shared library of wxWidgets will fail to load
