echo "Donot copy libraries to /lib directory, create a softlink instead to save space at /root directory"

ln -s stripped_libs/libcrypto.so.1.1    /lib/libcrypto.so.1.1
ln -s stripped_libs/libcrypto.so.1.1    /lib/libcrypto.so 

ln -s stripped_libs/libcurl.so.4.5.0    /lib/libcurl.so.4.5.0
ln -s stripped_libs/libcurl.so.4.5.0    /lib/libcurl.so.4
ln -s stripped_libs/libcurl.so.4.5.0    /lib/libcurl.so

ln -s stripped_libs/libmosquitto.so.1   /lib/libmosquitto.so.1
ln -s stripped_libs/libmosquitto.so.1   /lib/libmosquitto.so

ln -s stripped_libs/libssl.so.1.1       /lib/libssl.so.1.1
ln -s stripped_libs/libssl.so.1.1       /lib/libssl.so

ln -s stripped_libs/libz.so.1.2.11      /lib/libz.so.1.2.11
ln -s stripped_libs/libz.so.1.2.11      /lib/libz.so.1
ln -s stripped_libs/libz.so.1.2.11      /lib/libz.so



