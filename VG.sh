
#!/bin/bash

git clone --recursive https://github.com/vgteam/vg.git
cd vg
make get-deps
sudo apt-get install build-essential git cmake pkg-config libncurses-dev libbz2-dev  \
                     protobuf-compiler libprotoc-dev libprotobuf-dev libjansson-dev \
                     automake libtool jq bc rs curl unzip redland-utils \
                     librdf-dev bison flex gawk lzma-dev liblzma-dev liblz4-dev \
                     libffi-dev libcairo-dev


################################# make sure you have installed Cmake from here: https://github.com/Kitware/CMake/releases/download/v3.16.2/cmake-3.16.2.tar.gz

./source_me.sh && make
