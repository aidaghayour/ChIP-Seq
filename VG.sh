
#!/bin/bash

git clone --recursive https://github.com/vgteam/vg.git
cd vg
make get-deps
sudo apt-get install build-essential git cmake pkg-config libncurses-dev libbz2-dev  \
                     protobuf-compiler libprotoc-dev libprotobuf-dev libjansson-dev \
                     automake libtool jq bc rs curl unzip redland-utils \
                     librdf-dev bison flex gawk lzma-dev liblzma-dev liblz4-dev \
                     libffi-dev libcairo-dev


################################# make sure you have installed Cmake installed which links to openssl's curl libraries. This can be troublesome but this would work:
#https://leimao.github.io/blog/CMake-SSL-Support/
#cd /tmp
#sudo apt-get install libcurl4-openssl-dev
#wget https://github.com/Kitware/CMake/releases/download/v3.14.4/cmake-3.14.4.tar.gz
#tar -xf cmake-3.14.4.tar.gz
#cd cmake-3.14.4
#./bootstrap --system-curl --parallel=16 # Use `parallel` argument to accelerate the process
#make -j16 # Use `j` argument to accelerate the process
#sudo make install

./source_me.sh && make
