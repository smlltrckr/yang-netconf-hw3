# For Netconf and Yang installation

GG = git

OPENYUMA = https\://github.com/OpenClovis/OpenYuma.git
LIBNETCONF = https\://github.com/CESNET/libnetconf.git
NETOPEER = https\://github.com/CESNET/netopeer.git
PYANG = https\://github.com/mbj4668/pyang.git
REST = https\://github.com/CESNET/libnetconf.git https\://github.com/CESNET/netopeer.git https\://github.com/mbj4668/pyang.git
TARGETS = dependencies pyang libnetconf netopeer openyuma

.PHONY: rest

CFLAGS = -Wall -g -c

all: $(TARGETS)

dependencies:
	sudo apt-get install libxml2-dev 
	sudo apt-get install libxslt-dev
	sudo apt-get install openssl 
	sudo apt-get install libdbus-1-dev
	sudo apt-get install doxygen 
	sudo apt-get install libtool 
	sudo apt-get install libtool-bin 
	sudo apt-get install libcurl4-openssl-dev 
	sudo apt-get install libevent-dev 
	sudo apt-get install xsltproc 
	sudo apt-get install python-setuptools
	sudo apt-get install zlib1g-dev
	sudo apt-get install python-libxml2
	wget https://red.libssh.org/attachments/download/195/libssh-0.7.3.tar.xz
	unxz libssh-0.7.3.tar.xz
	tar -xvf libssh-0.7.3.tar
	cd libssh-0.7.3/ && mkdir build && cd build && cmake .. && make && sudo make install

pyang: 
	git clone $(PYANG)
	cd pyang && sudo python setup.py install

libnetconf: 
	git clone $(LIBNETCONF)

netopeer: 
	git clone $(NETOPEER)
	
openyuma: 
	git clone $(OPENYUMA)
# OpenYuma
# sudo apt-get install libxml2-dev libxmlt1-dev libssl-dev
# tar -xvf libssh2-1.8.0.tar.gz
# mv libssh2-1.8.0 libssh2
# cd libssh2
# ./configure
# make
# sudo make install

# libssh
# wget https://red.libssh.org/attachments/download/195/libssh-0.7.3.tar.xz
# unxz libssh-0.7.3.tar.xz
# tar -xvf libssh-0.7.3.tar
# cd libssh-0.7.3/
# mkdir build
# cd build/
# cmake ..
# make
# sudo make install
