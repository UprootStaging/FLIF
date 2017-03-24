set -ex

mkdir ~/build
cd ~/build
wget "http://prdownloads.sourceforge.net/libpng/libpng-1.6.28.tar.xz"
cd libpng-1.6.28/
./configure
make install
