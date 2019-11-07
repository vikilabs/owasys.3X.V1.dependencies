PATH=$PATH:/opt/crosstool/arm-none-linux-gnueabi/bin
export PATH
export AR=/opt/crosstool/arm-none-linux-gnueabi/bin/arm-none-linux-gnueabi-ar
export AS=/opt/crosstool/arm-none-linux-gnueabi/bin/arm-none-linux-gnueabi-as
export LD=/opt/crosstool/arm-none-linux-gnueabi/bin/arm-none-linux-gnueabi-ld
export RANLIB=/opt/crosstool/arm-none-linux-gnueabi/bin/arm-none-linux-gnueabi-ranlib
export CC=/opt/crosstool/arm-none-linux-gnueabi/bin/arm-none-linux-gnueabi-gcc
export NM=/opt/crosstool/arm-none-linux-gnueabi/bin/arm-none-linux-gnueabi-nm
export CXX=/opt/crosstool/arm-none-linux-gnueabi/bin/arm-none-linux-gnueabi-g++
export LIBFFI_CFLAGS='-I/opt/crosstool/arm-none-linux-gnueabi/arm-none-linux-gnueabi/libc/usr/include/'
export LIBFFI_LIBS='-L/opt/crosstool/arm-none-linux-gnueabi/arm-none-linux-gnueabi/libc/lib -lffi'


./configure -shared -prefix=/opt/crosstool/arm-none-linux-gnueabi/arm-none-linux-gnueabi/libc/usr
make
sudo env "PATH=$PATH" make install

