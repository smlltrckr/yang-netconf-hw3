# For Netconf and Yang installation

GG = git

OPENYUMA = https\://github.com/OpenClovis/OpenYuma.git
LIBNETCONF = https\://github.com/CESNET/libnetconf.git
NETOPEER = https\://github.com/CESNET/netopeer.git
PYANG = https\://github.com/mbj4668/pyang.git
REST = https\://github.com/CESNET/libnetconf.git https\://github.com/CESNET/netopeer.git https\://github.com/mbj4668/pyang.git
TARGETS = dockerUbuntu1604 pyang netopeer openyuma instructions

CFLAGS = -Wall -g -c

all: $(TARGETS)

dockerUbuntu1604:
	sudo apt-get update
	sudo apt-get install apt-transport-https ca-certificates
	sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
	echo deb https://apt.dockerproject.org/repo ubuntu-xenial main | sudo tee /etc/apt/sources.list.d/docker.list
	apt-cache policy docker-engine
	sudo apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual
	sudo apt-get install docker-engine
	sudo service docker start
	# Test if installed correctly:
	# sudo docker run hello-world

pyang: 
	git clone $(PYANG)
	sudo apt-get install python-setuptools
	cd pyang/ && sudo python setup.py install
	# json2xml pyang yang2sdl yang2html
netopeer: 
	git clone $(NETOPEER)
	cd netopeer/ && sudo docker build -t netopeer .
	

openyuma: 
	git clone $(OPENYUMA)
	cd OpenYuma/ && sudo docker build -t openyuma .
	

instructions:
	# To start netopeer run the following:
	# sudo docker run -it --rm -p 8300:830 --name netopeer netopeer
	# To start openyuma run the following:
	# sudo docker run -it --rm -p 8300:830 -p 2200:22 --name openyuma openyuma
	
# DOCKER
# sudo service docker start | stop | status | restart


# https://docs.docker.com/engine/installation/linux/ubuntulinux/
# http://seguesoft.com/how-to-set-up-netopeer-server-to-use-with-netconfc


# Obsolete
# dependencies:
# 	sudo apt-get install libxml2-dev 
# 	sudo apt-get install libxslt-dev
# 	sudo apt-get install openssl 
# 	sudo apt-get install libdbus-1-dev
# 	sudo apt-get install doxygen 
# 	sudo apt-get install libtool 
# 	sudo apt-get install libtool-bin 
# 	sudo apt-get install libcurl4-openssl-dev 
# 	sudo apt-get install libevent-dev 
# 	sudo apt-get install xsltproc 
# 	sudo apt-get install python-setuptools
# 	sudo apt-get install zlib1g-dev
# 	sudo apt-get install python-libxml2
# 	sudo apt-get install openssh-server
# 	wget https://red.libssh.org/attachments/download/195/libssh-0.7.3.tar.xz
# 	unxz libssh-0.7.3.tar.xz
# 	tar -xvf libssh-0.7.3.tar
# 	cd libssh-0.7.3/ && mkdir build && cd build && cmake .. && make && sudo make install

# install:
	# sudo apt-get update
	# sudo apt-get install apt-transport-https ca-certificates
	# sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
	# echo deb https://apt.dockerproject.org/repo ubuntu-xenial main | sudo tee /etc/apt/sources.list.d/docker.list
	# sudo apt-get update
	# apt-cache policy docker-engine
	# sudo apt-get update
	# sudo apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual
	# sudo apt-get update
	# sudo apt-get install docker-engine
	# sudo service docker start
	# sudo docker run hello-world
	# git clone $(PYANG)
	# cd pyang/ && sudo python setup.py install
	# git clone $(NETOPEER)
	# cd netopeer/ && sudo docker build -t netopeer .
	# git clone $(OPENYUMA)
	# cd OpenYuma/ && sudo docker build -t openyuma .

# libnetconf: 
	# git clone $(LIBNETCONF)
	# cd libnetconf/ && ./configure && make && sudo make install
	# https://github.com/CESNET/libnetconf

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
