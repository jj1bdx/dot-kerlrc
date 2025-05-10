# Building local wxWidgets

## MacOS

* Use HomeBrew for 3.2.8: `brew install wxwidgets`

## Ubuntu 22.04

* Use wxWidgets 3.2.8
* See `wxWidgets3.2-k2r-configure.sh`


### Manual build

* Download the source code from <https://www.wxwidgets.org/downloads/>
* Disable compat28 by `--disable-compat28` (default setting)
* To use locally-built wxGTK, set the following kerl configuration option to the appropriate `wx-config`
  - example: `--with-wx-config=/opt/wx-3.2/bin/wx-config`
  - Note well: to use the shared library, add the path to `LD_LIBRARY_PATH`, otherwise the shared library of wxWidgets will fail to load
