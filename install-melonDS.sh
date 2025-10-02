sudo apt install cmake extra-cmake-modules libcurl4-gnutls-dev libpcap0.8-dev libsdl2-dev libarchive-dev libenet-dev libzstd-dev
sudo apt install qt6-base-dev
sudo apt install qt6-base-private-dev
sudo apt install qt6-multimedia-dev
sudo apt install libqt6svg6-dev
cd ~/Downloads
git clone https://github.com/melonDS-emu/melonDS
cd melonDS
cmake -B build
cmake --build build -j$(nproc --all)
