#!/bin/bash

[ ! -e configure ] && NOCONFIGURE=1 ./autogen.sh

GLIB_GENMARSHAL="`which glib-genmarshal`" \
GLIB_MKENUMS="`which glib-mkenums`" \
CFLAGS="-DGST_DISABLE_PRINTF_EXTENSION -fPIC -fno-omit-frame-pointer -funwind-tables -Wl,--no-merge-exidx-entries" \
PKG_CONFIG=arm-linux-pkg-config \
./configure --host=arm-linux --with-sysroot=/chroot --prefix= --enable-gst-debug --disable-nls --disable-examples --disable-benchmarks --with-unwind=no gt_cv_func_CFPreferencesCopyAppValue=no gt_cv_func_CFLocaleCopyCurrent=no
make -j8
make DESTDIR=/chroot install
