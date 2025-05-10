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
      --prefix="/opt/wx-3.2"
#      --with-gtk \
#      --enable-compat30
#      --enable-unicode \
#      --enable-webview \
#      --enable-mediactrl \
