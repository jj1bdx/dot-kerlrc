#
# apt packages:
# libgtk-4-dev libgtk-3-dev
# libwxgtk-webview3.0-gtk3-dev libwxgtk-media3.0-gtk3-dev
# libwxgtk3.0-gtk3-dev
# for webview:
# libwebkit2gtk-4.0-dev
# for mediactrl/Gstreamer:
# libgstreamer1.0-dev libgstreamer-plugins-bad1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-good1.0-dev
# Build options quoted from Homebrew wxwidgets
# Dan Gudmundsson suggested disabling compat28
../configure \
      --prefix="/opt/wx-3.2" \
      --with-gtk \
      --enable-clipboard \
      --enable-controls \
      --enable-dataviewctrl \
      --enable-display \
      --enable-dnd \
      --enable-graphics_ctx \
      --enable-std_string \
      --enable-svg \
      --enable-unicode \
      --enable-webviewwebkit \
      --with-expat \
      --with-libjpeg \
      --with-libpng \
      --with-libtiff \
      --with-opengl \
      --with-zlib \
      --disable-tests \
      --disable-precomp-headers \
      --disable-monolithic
#      --with-liblzma \
#      --enable-precomp-headers \
#      --enable-monolithic
