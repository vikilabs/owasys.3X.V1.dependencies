path=$path:/opt/crosstool/arm-none-linux-gnueabi/bin
export path
export ar=/opt/crosstool/arm-none-linux-gnueabi/bin/arm-none-linux-gnueabi-ar
export as=/opt/crosstool/arm-none-linux-gnueabi/bin/arm-none-linux-gnueabi-as
export ld=/opt/crosstool/arm-none-linux-gnueabi/bin/arm-none-linux-gnueabi-ld
export ranlib=/opt/crosstool/arm-none-linux-gnueabi/bin/arm-none-linux-gnueabi-ranlib
export cc=/opt/crosstool/arm-none-linux-gnueabi/bin/arm-none-linux-gnueabi-gcc
export nm=/opt/crosstool/arm-none-linux-gnueabi/bin/arm-none-linux-gnueabi-nm
export cxx=/opt/crosstool/arm-none-linux-gnueabi/bin/arm-none-linux-gnueabi-g++
export libffi_cflags='-i/opt/crosstool/arm-none-linux-gnueabi/arm-none-linux-gnueabi/libc/usr/include/'
export libffi_libs='-l/opt/crosstool/arm-none-linux-gnueabi/arm-none-linux-gnueabi/libc/lib -lffi'

make clean
make -j 4 WITH_SRV=no WITH_UUID=no

