# This repo contains the list of dependencies for OWASYS 3X telematics platform

### Prerequisite: 
	
	- Make Sure vikilabs/OwasysDevEnvironmentSetup is installed in your ubuntu system
	- This package works only with ubuntu 16.04

## Libraries: 
	
	- libssl.so
	- libcrypto.so
	- libz.so
	- libcurl.so
 
## Installing Libraries in Owasys OWA 3X device
	
	- Clone this repository  
	- cd unstripped_libs
	- copy all the libraries to OWASYS Device ( /lib ) directory
	- use lrz command to copy the libraries 

### Example:

	1. Login to OWA board (sudo minicom owa )
	2. cd /lib
	3. lrz ( command to transfer file from ubuntu to owasys device )
	4. ctrl + a + s
    	5. select zmodem
    	6. navigate to the library file location
    	7. “type the file name”
    	8. Hit Okay

## Installing Libraries in Ubuntu 16.04

	- Clone this repository to your Ubuntu system
	- cd src/openssl-1.0.2q   
	- ./vikilabs_install.sh     #Compile and Install Open SSL Libraries for OWASYS ( On Ubuntu )
	- cd src/zlib-1.2.11/
	- ./vikilabs_install.sh     #Compile and Install ZLIB Libraries for OWASYS ( On Ubuntu )
	- cd src/mosquitto-1.5.5 
	- ./vikilabs_install.sh     #Compile and Install MOSQUITTO Libraries for OWASYS ( On Ubuntu )
	- cd src/curl-7.63.0
	- ./vikilabs_install.sh     #Compile and Install CURL Libraries for OWASYS ( On Ubuntu )

## Note:
	
	1. Converting unstripped library(binary) to stripped library(binary)

		- $arm-none-linux-gnueabi-strip --strip-unneeded libcurl.so

	2. On ubuntu all shared( dynamic )/static libraries for OWASYS are located at 

		- /opt/crosstool/arm-none-linux-gnueabi/arm-none-linux-gnueabi/libc/usr/lib/

	3. On ubuntu all header files for OWASYS are located at
		
		- /opt/crosstool/arm-none-linux-gnueabi/arm-none-linux-gnueabi/libc/usr/include/
	
	4. On OWASYS Device the shared( dynamic )/static libraries are at
		
		- /lib

 


