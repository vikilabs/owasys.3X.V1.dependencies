./configure -shared -prefix=/opt/crosstool/arm-none-linux-gnueabi/arm-none-linux-gnueabi/libc/usr
make
sudo env "PATH=$PATH" make install

