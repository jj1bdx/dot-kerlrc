#
# apt packages:
# libgtk-4-dev libgtk-3-dev
# libwxgtk-webview3.0-gtk3-dev libwxgtk-media3.0-gtk3-dev
# libwxgtk3.0-gtk3-dev
# for webview:
# libwebkit2gtk-4.0-dev
# for mediactrl/Gstreamer:
# libgstreamer1.0-dev libgstreamer-plugins-bad1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-good1.0-dev
#
../configure \
      --prefix="/opt/wx-3.1" \
      --enable-compat30 \
      --enable-unicode \
      --enable-webview \
      --enable-mediactrl \
      --with-gtk
#      --enable-clipboard \
#      --enable-controls \
#      --enable-dataviewctrl \
#      --enable-display \
#      --enable-dnd \
#      --enable-graphics_ctx \
#      --enable-std_string \
#      --enable-svg \
#      --enable-unicode \
#      --with-expat \
#      --with-libjpeg \
#      --with-libpng \
#      --with-libtiff \
#      --with-opengl \
#      --with-zlib \
#      --disable-precomp-headers \
#      --disable-monolithic
