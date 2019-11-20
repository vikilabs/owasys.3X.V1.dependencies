PATH=$PATH:/opt/crosstool/arm-none-linux-gnueabi/bin
export PATH

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

export CC=arm-none-linux-gnueabi-gcc
export LDFLAGS=-Wl,--gc-sections
export CFLAGS="-ffunction-sections -fdata-sections"

./configure --prefix="/opt/crosstool/arm-none-linux-gnueabi/arm-none-linux-gnueabi/libc/usr" --host=arm-none-linux-gnueabi

if [ $? -eq 0 ]; then
    echo "[ success ] Configuration"
else
    echo "[ failure ] Configuration"
    exit 1
fi

make -j 8

if [ $? -eq 0 ]; then
    echo "[ success ] make"
else
    echo "[ failure ] make"
    exit 1
fi

make -j 8 PROGRAMS="scp"

if [ $? -eq 0 ]; then
    echo "[ success ] make scp"
else
    echo "[ failure ] make scp"
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

mkdir ../../stripped_bin_new 2>/dev/null
mkdir ../../unstripped_bin_new 2>/dev/null


cp dropbear ../../unstripped_bin_new/ 
cp dropbearconvert ../../unstripped_bin_new/
cp dropbearkey ../../unstripped_bin_new/
cp dbclient ../../unstripped_bin_new/
cp scp ../../unstripped_bin_new/


echo "[ Stripping Binaries ]"

arm-none-linux-gnueabi-strip dropbear dropbearconvert dropbearkey dbclient scp

if [ $? -eq 0 ]; then
    echo "[ success ] stripped - dropbear, dropbearconvert, dropbearkey, dbclient, scp"
else
    echo "[ failure ] strip failed - dropbear, dropbearconvert, dropbearkey, dbclient, scp"
    exit 1
fi

cp dropbear ../../stripped_bin_new/ 
cp dropbearconvert ../../stripped_bin_new/
cp dropbearkey ../../stripped_bin_new/
cp dbclient ../../stripped_bin_new/
cp scp ../../stripped_bin_new/

