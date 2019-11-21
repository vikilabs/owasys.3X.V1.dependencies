echo "Donot copy libraries to /lib directory, create a softlink instead to save space at /root directory"

echo "make sure this script is copied to the beginning of userinit.sh"

SYSTEM_LIB="/lib"
USER_LIB="/home/stripped_libs"

rm -rf  $SYSTEM_LIB/libcrypto.so* 
rm -rf  $SYSTEM_LIB/libcurl.so*
rm -rf  $SYSTEM_LIB/libmosquitto.so*
rm -rf  $SYSTEM_LIB/libssl.so* 
rm -rf  $SYSTEM_LIB/libz.so* 

ln -s $USER_LIB/libcrypto.so.1.1    $SYSTEM_LIB/libcrypto.so.1.1
ln -s $USER_LIB/libcrypto.so.1.1    $SYSTEM_LIB/libcrypto.so 

ln -s $USER_LIB/libcurl.so.4.5.0    $SYSTEM_LIB/libcurl.so.4.5.0
ln -s $USER_LIB/libcurl.so.4.5.0    $SYSTEM_LIB/libcurl.so.4
ln -s $USER_LIB/libcurl.so.4.5.0    $SYSTEM_LIB/libcurl.so

ln -s $USER_LIB/libmosquitto.so.1   $SYSTEM_LIB/libmosquitto.so.1
ln -s $USER_LIB/libmosquitto.so.1   $SYSTEM_LIB/libmosquitto.so

ln -s $USER_LIB/libssl.so.1.1       $SYSTEM_LIB/libssl.so.1.1
ln -s $USER_LIB/libssl.so.1.1       $SYSTEM_LIB/libssl.so

ln -s $USER_LIB/libz.so.1.2.11      $SYSTEM_LIB/libz.so.1.2.11
ln -s $USER_LIB/libz.so.1.2.11      $SYSTEM_LIB/libz.so.1
ln -s $USER_LIB/libz.so.1.2.11      $SYSTEM_LIB/libz.so



