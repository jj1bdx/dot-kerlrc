#
# apt packages:
# libgtk-4-dev libgtk-3-dev
# libwxgtk-webview3.0-gtk3-dev libwxgtk-media3.0-gtk3-dev
# libwxgtk3.0-gtk3-dev
#
../configure \
      --prefix="/opt/wx-3.1" \
      --enable-compat28 \
      --enable-compat30 \
      --enable-unicode \
      --with-gtk
#
#      --enable-clipboard \
#      --enable-controls \
#      --enable-dataviewctrl \
#      --enable-display \
#      --enable-dnd \
#      --enable-graphics_ctx \
#      --enable-std_string \
#      --enable-svg \
#      --enable-unicode \
#      --enable-webview \
#      --with-expat \
#      --with-libjpeg \
#      --with-libpng \
#      --with-libtiff \
#      --with-opengl \
#      --with-zlib \
#      --disable-precomp-headers \
#      --disable-monolithic
