./Configure --prefix=/opt/crosstool/arm-none-linux-gnueabi/arm-none-linux-gnueabi/libc/usr --openssldir=/opt/crosstool/arm-none-linux-gnueabi/arm-none-linux-gnueabi/libc/usr/ssl --cross-compile-prefix=arm-none-linux-gnueabi- shared linux-armv4 no-asm threads

make depend
make -j 4
sudo env "PATH=$PATH" make install

