
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


#add the folder to the path: export PATH=$PATH:/tmp/cmake-3.14.4/
./source_me.sh && make

#go to vg/test directory
cd ./vg/test

#run the vg in bin and construct a tiny Pangenome graph, convert it to dot format and make a svg file of its visualization
./bin/vg construct -v ./tiny/tiny.vcf.gz -r ./tiny/tiny.fa \ | vg view -d - \ | dot -Tsvg -o x.svg

#Install tabix to index vcf file before making the graph!
#http://genometoolbox.blogspot.com/2013/11/installing-tabix-on-unix.html
# work with small datasets and make the graph of the vg format
./bin/vg construct -r small/x.fa -v small/x.vcf.gz > x.vg



