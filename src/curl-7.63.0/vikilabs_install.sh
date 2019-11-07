sudo ls > /dev/null
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


export CROSS_COMPILE="/opt/crosstool/arm-none-linux-gnueabi/bin/arm-none-linux-gnueabi"
export AR=${CROSS_COMPILE}-ar
export AS=${CROSS_COMPILE}-as
export LD=${CROSS_COMPILE}-ld
export RANLIB=${CROSS_COMPILE}-ranlib
export CC=${CROSS_COMPILE}-gcc
export NM=${CROSS_COMPILE}-nm

export CPATH="/opt/crosstool/arm-none-linux-gnueabi/arm-none-linux-gnueabi/libc/usr/include/"
export CPPFLAGS="/opt/crosstool/arm-none-linux-gnueabi/arm-none-linux-gnueabi/libc/usr/include/"
export LDFLAGS="/opt/crosstool/arm-none-linux-gnueabi/arm-none-linux-gnueabi/libc/lib"
export LIBRARY_PATH="/opt/crosstool/arm-none-linux-gnueabi/arm-none-linux-gnueabi/libc/lib"

echo "Assuming openssl is installed already"

./configure --prefix="$HOME/curl-for-owa3x/" --target=${CROSS_COMPILE} --host=${CROSS_COMPILE} --build=i586-pc-linux-gnu --enable-threaded-resolver  --with-ca-fallback --disable-gopher  --without-winssl --without-darwinssl --disable-manual 
LDFLAGS="-L/opt/crosstool/arm-none-linux-gnueabi/arm-none-linux-gnueabi/libc/lib" CFLAGS="-I/opt/crosstool/arm-none-linux-gnueabi/arm-none-linux-gnueabi/libc/usr/include/" CPPFLAGS="-I/opt/crosstool/arm-none-linux-gnueabi/arm-none-linux-gnueabi/libc/usr/include/"

make

make install

