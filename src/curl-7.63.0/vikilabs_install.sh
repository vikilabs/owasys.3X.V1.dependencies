export CROSS_COMPILE="arm-none-linux-gnueabi"
export AR=${CROSS_COMPILE}-ar
export AS=${CROSS_COMPILE}-as
export LD=${CROSS_COMPILE}-ld
export RANLIB=${CROSS_COMPILE}-ranlib
export CC=${CROSS_COMPILE}-gcc
export NM=${CROSS_COMPILE}-nm

echo "Assuming openssl is installed already"

./configure --prefix="$HOME/curl-for-owa3x/" --target=${CROSS_COMPILE} --host=${CROSS_COMPILE} --build=i586-pc-linux-gnu --enable-threaded-resolver  --with-ca-fallback --disable-gopher  --without-winssl --without-darwinssl --disable-manual

make

make install

