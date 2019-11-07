export CC=arm-none-linux-gnueabi-gcc
export CXX=arm-none-linux-gnueabi-g++
make clean
make -j 4 WITH_SRV=no WITH_UUID=no

