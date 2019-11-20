cd /home/bin/
ls dbclient dropbear dropbearconvert dropbearkey scp

if [ $? -eq 0 ]; then
    echo "[ success ] dropbear binary present "
else
    echo "[ failure ] dropbear binaries missing "
    exit 1
fi

mkdir -p /home/@sysinit/etc

cd /home/@sysinit/etc/

if [ $? -eq 0 ]; then
    echo "[ success ] cd /home/@sysinit/etc/ "
else
    echo "[ failure ] cd /home/@sysinit/etc/ "
    exit 1
fi


/home/bin/dropbearkey -t rsa -f dropbear_rsa_host_key

if [ $? -eq 0 ]; then
    echo "[ success ] rsa key gen "
else
    echo "[ failure ] rsa key gen"
    exit 1
fi


/home/bin/dropbearkey -t dss -f dropbear_dss_host_key

if [ $? -eq 0 ]; then
    echo "[ success ] dss key gen "
else
    echo "[ failure ] dss key gen"
    exit 1
fi



mkdir -p /home/@sysinit/usr/bin/

cd /home/@sysinit/usr/bin/

ln -s /home/bin/dbclient dbclient

if [ $? -eq 0 ]; then
    echo "[ success ] ln -s /home/bin/dbclient dbclient "
else
    echo "[ failure ] ln -s /home/bin/dbclient dbclient"
    exit 1
fi


mkdir -p /home/@sysyinit/bin/

cd /home/@sysyinit/bin/

ln -s /home/bin/dropbear dropbear
ln -s /home/bin/dbclient dbclient
ln -s /home/bin/dropbearkey dropbearkey
ln -s /home/bin/scp scp

if [ $? -eq 0 ]; then
    echo "[ success ] linking binaries "
else
    echo "[ failure ] linking binaries"
    exit 1
fi



echo "/home/bin/dropbear &" >> /home/userinit.sh

if [ $? -eq 0 ]; then
    echo "[ success ] added dropbear ssh server to startup"
else
    echo "[ failure ] adding dropbear ssh server to startup"
    exit 1
fi

echo "Rebooting System"

reboot

