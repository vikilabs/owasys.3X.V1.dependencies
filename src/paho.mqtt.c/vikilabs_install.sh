sudo apt-get install cmake doxygen graphviz libssl-dev ninja-build
export CC=arm-none-linux-gnueabi-gcc
cmake -GNinja -DPAHO_WITH_SSL=TRUE -DPAHO_BUILD_SAMPLES=TRUE -DPAHO_BUILD_DOCUMENTATION=TRUE -DOPENSSL_LIB_SEARCH_PATH=/opt/crosstool/arm-none-linux-gnueabi/arm-none-linux-gnueabi/libc/usr -DOPENSSL_INC_SEARCH_PATH="/opt/crosstool/arm-none-linux-gnueabi/arm-none-linux-gnueabi/libc/usr/ssl;/opt/crosstool/arm-none-linux-gnueabi/arm-none-linux-gnueabi/libc/usr" -DCMAKE_TOOLCHAIN_FILE=./owa3x.arm9-toolchain.cmake .
make -j 4

echo "WARNING: This installer doesn't work check the document"
