sudo ls > /dev/null
echo "[ info ] Setting Up environment variables"
PATH=$PATH:/opt/crosstool/arm-none-linux-gnueabi/bin
export PATH
export CROSS_COMPILE="arm-none-linux-gnueabi"
export AR=${CROSS_COMPILE}-ar
export AS=${CROSS_COMPILE}-as
export LD=${CROSS_COMPILE}-ld
export RANLIB=${CROSS_COMPILE}-ranlib
export CC=${CROSS_COMPILE}-gcc
export NM=${CROSS_COMPILE}-nm

#Relink Compilation Parameters for ARM

unlink /usr/bin/gcc
unlink /usr/bin/as
unlink /usr/bin/ar
unlink /usr/bin/g++
unlink /usr/bin/nm
unlink /usr/bin/ld
unlink /usr/bin/ranlib

if [ $? -eq 0 ]; then
    echo "[ success ] unlink "
else
    echo "[ failure ] unlink "
    exit 1
fi



ln -s  /opt/crosstool/arm-none-linux-gnueabi/bin/arm-none-linux-gnueabi-gcc     /usr/bin/gcc
ln -s  /opt/crosstool/arm-none-linux-gnueabi/bin/arm-none-linux-gnueabi-as      /usr/bin/as
ln -s  /opt/crosstool/arm-none-linux-gnueabi/bin/arm-none-linux-gnueabi-ar      /usr/bin/ar
ln -s  /opt/crosstool/arm-none-linux-gnueabi/bin/arm-none-linux-gnueabi-g++     /usr/bin/g++      
ln -s  /opt/crosstool/arm-none-linux-gnueabi/bin/arm-none-linux-gnueabi-nm      /usr/bin/nm
ln -s  /opt/crosstool/arm-none-linux-gnueabi/bin/arm-none-linux-gnueabi-ld      /usr/bin/ld
ln -s  /opt/crosstool/arm-none-linux-gnueabi/bin/arm-none-linux-gnueabi-ranlib  /usr/bin/ranlib

if [ $? -eq 0 ]; then
    echo "[ success ] softlink "
else
    echo "[ failure ] softlink "
    exit 1
fi

echo "[ info ] Installing curl with ssl support"
./configure --prefix=/opt/crosstool/arm-none-linux-gnueabi/arm-none-linux-gnueabi/libc/usr --target=${CROSS_COMPILE} --host=${CROSS_COMPILE} --build=i586-pc-linux-gnu --enable-threaded-resolver  --with-ca-fallback --disable-gopher  --without-winssl --without-darwinssl --disable-manual

if [ $? -eq 0 ]; then
    echo "[ success ] Configuration"
else
    echo "[ failure ] Configuration"
    exit 1
fi


make

if [ $? -eq 0 ]; then
    echo "[ success ] make"
else
    echo "[ failure ] make"
    exit 1
fi


make install

if [ $? -eq 0 ]; then
    echo "[ success ] make install"
else
    echo "[ failure ] make install"
    exit 1
fi

make clean

if [ $? -eq 0 ]; then
    echo "[ success ] Make Clean"
else
    echo "[ failure ] Make Clean"
    exit 1
fi



#Relink Compilation Parameter for Intel
unlink /usr/bin/gcc
unlink /usr/bin/as
unlink /usr/bin/ar
unlink /usr/bin/g++
unlink /usr/bin/nm
unlink /usr/bin/ld
unlink /usr/bin/ranlib

if [ $? -eq 0 ]; then
    echo "[ success ] unlink "
else
    echo "[ failure ] unlink "
    exit 1
fi



ln -s /usr/bin/gcc-5                      /usr/bin/gcc
ln -s /usr/bin/x86_64-linux-gnu-as        /usr/bin/as
ln -s /usr/bin/x86_64-linux-gnu-ar        /usr/bin/ar
ln -s /usr/bin/g++-5                      /usr/bin/g++      
ln -s /usr/bin/x86_64-linux-gnu-nm        /usr/bin/nm
ln -s /usr/bin/x86_64-linux-gnu-ld        /usr/bin/ld
ln -s /usr/bin/x86_64-linux-gnu-ranlib    /usr/bin/ranlib

if [ $? -eq 0 ]; then
    echo "[ success ] softlink "
else
    echo "[ failure ] softlink "
    exit 1
fi

echo "[ Checking Library ] curl"

ls /opt/crosstool/arm-none-linux-gnueabi/arm-none-linux-gnueabi/libc/usr/bin/curl

if [ $? -eq 0 ]; then
    echo "[ success ] curl binary exist"
    echo "[ success ] curl installed successfully in the OWASYS crossplatform toolchain"
else
    echo "[ failure ] curl binary exist"
    echo "[ failure ] curl installed successfully in the OWASYS crossplatform toolchain"
    exit 1
fi

ls /opt/crosstool/arm-none-linux-gnueabi/arm-none-linux-gnueabi/libc/usr/lib/libcurl.so

if [ $? -eq 0 ]; then
    echo "[ success ] libcurl.so library exist"
    echo "[ success ] curl library installed successfully"
else
    echo "[ failure ] libcurl.so library exist"
    echo "[ failure ] curl library installed successfully"
    exit 1
fi

mkdir ../../stripped_bin_new
mkdir ../../stripped_lib_new
mkdir ../../unstripped_bin_new
mkdir ../../unstripped_lib_new

sudo cp -r /opt/crosstool/arm-none-linux-gnueabi/arm-none-linux-gnueabi/libc/usr/bin/curl ../../unstripped_bin_new/
sudo cp -r /opt/crosstool/arm-none-linux-gnueabi/arm-none-linux-gnueabi/libc/usr/lib/libcurl.so* ../../unstripped_lib_new/

sudo cp -r ../../unstripped_bin_new/curl ../../stripped_bin_new/
sudo cp -r ../../unstripped_lib_new/libcurl.so* ../../stripped_lib_new/

cd ../../stripped_bin_new/
sudo arm-none-linux-gnueabi-strip curl

if [ $? -eq 0 ]; then
    echo "[ success ] curl binary stripped successfully"
else
    echo "[ failure ] unable to strip curl binary"
    exit 1
fi

ls -l curl
ls -l ../unstripped_bin_new/curl



cd  ../stripped_lib_new/
sudo /opt/crosstool/arm-none-linux-gnueabi/bin/arm-none-linux-gnueabi-strip libcurl.so.4.5.0

if [ $? -eq 0 ]; then
    echo "[ success ] libcurl stripped successfully"
else
    echo "[ failure ] unable to strip  libcurl"
    exit 1
fi


sudo rm libcurl.so
suro rm libcurl.so.4
sudo ln -s libcurl.so.4.5.0 libcurl.so
sudo ln -s libcurl.so.4.5.0 libcurl.so.4

ls -l libcurl.so*
ls -l ../unstripped_lib_new/libcurl.so*



