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
export CXX=arm-none-linux-gnueabi-g++
	
make clean


make -j 4 WITH_SRV=no WITH_UUID=no

if [ $? -eq 0 ]; then
    echo "[ success ] make "
else
    echo "[ failure ] make "
    exit 1
fi

make clean

if [ $? -eq 0 ]; then
    echo "[ success ] make clean"
else
    echo "[ failure ] make clean"
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



echo "[ Checking Library ] libmosquitto.so"

ls /opt/crosstool/arm-none-linux-gnueabi/arm-none-linux-gnueabi/libc/lib/libmosquitto.so

if [ $? -eq 0 ]; then
    echo "[ success ] libmosquitto.so exist"
    echo "[ success ] Mosquitto Library installed successfully"
else
    echo "[ failure ] libmosquitto.so  doesn't exist"
    echo "[ failure ] Mosquitto Library installation failed"
    exit 1
fi

mkdir ../../stripped_lib_new
mkdir ../../unstripped_lib_new

sudo cp -r /opt/crosstool/arm-none-linux-gnueabi/arm-none-linux-gnueabi/libc/lib/libmosquitto.so* ../../unstripped_lib_new/

sudo cp -r ../../unstripped_lib_new/libmosquitto.so* ../../stripped_lib_new/

cd ../../stripped_lib_new/
sudo arm-none-linux-gnueabi-strip libmosquitto.so.1

ls

if [ $? -eq 0 ]; then
    echo "[ success ] libmosquitto.so stripped successfully"
else
    echo "[ failure ] unable to strip  libmosquitto.so"
    exit 1
fi

sudo rm libmosquitto.so
sudo ln -s libmosquitto.so.1 libmosquitto.so

ls -l libmosquitto.so*
ls -l ../unstripped_lib_new/libmosquitto.so*


