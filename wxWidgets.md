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
* OTP 25.0 cannot compile with wxWidgets-3.1.6.0 wxGTK
  - See wxwidgets3.1-k2r-configure.sh for the building options
* OTP 25.0 can compile with wxWidgets-3.0.5 wxGTK
  - See wxwidgets3.1-k2r-configure.sh for the building options
* To use locally-built wxGTK, set the following kerl configuration option to the appropriate `wx-config`
  - example: `--with-wx-config=/opt/wx-3.0/bin/wx-config`
