# Download and extract GLIBC 2.35
wget http://ftp.gnu.org/gnu/libc/glibc-2.35.tar.gz
tar -xvf glibc-2.35.tar.gz
mkdir build && cd build
../glibc-2.35/configure --prefix=/opt/glibc-2.35
make -j$(nproc)
sudo make install
