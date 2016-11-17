# For Netconf and Yang installation

GG = git

OPENYUMA = https\://github.com/OpenClovis/OpenYuma.git
LIBNETCONF = https\://github.com/CESNET/libnetconf.git
NETOPEER = https\://github.com/CESNET/netopeer.git
PYANG = https\://github.com/mbj4668/pyang.git
REST = https\://github.com/CESNET/libnetconf.git https\://github.com/CESNET/netopeer.git https\://github.com/mbj4668/pyang.git
TARGETS = openyuma libnetconf netopeer pyang

.PHONY: rest

CFLAGS = -Wall -g

all: $(TARGETS)

openyuma: git clone $(OPENYUMA)

libnetconf: git clone $(LIBNETCONF)

netopeer: git clone $(NETOPEER)

pyang: git clone $(PYANG)

rest: $(GG) clone $(REST) 
# OpenYuma
# sudo apt-get install libxml2-dev libxmlt1-dev libssl-dev
# tar -xvf libssh2-1.8.0.tar.gz
# mv libssh2-1.8.0 libssh2
# cd libssh2
# ./configure
# make
# sudo make install
