#!/bin/bash

cd ~
# system update
sudo apt update -y

# 日本語入力、USBメモリ利用、ファイルマネージャ
sudo apt install -y ibus-mozc rename mc exfat-fuse exfat-utils

# np21kのビルドに必要なモジュール
sudo apt install -y git ninja-build build-essential 
sudo apt install -y libsdl2-dev libsdl2-mixer-dev libsdl2-ttf-dev libsdl1.2-dev libsdl-mixer1.2-dev libsdl-ttf2.0-dev 
sudo apt install -y libusb-1.0-0-dev libssl-dev libfontconfig-dev libgtk2.0-dev

# cmake install
wget https://github.com/Kitware/CMake/releases/download/v3.22.0/cmake-3.22.0.tar.gz
tar xvf cmake3.22.0.tar.gz
cd cmake-3.22.0
./bootstrap && make && sudo make install
cd ..
sudo apt upgrade -y

# sdl版のbuild&install
git clone https://github.com/AZO234/NP2kai
cd NP2kai
mkdir build && cd build
cmake .. -D BUILD_SDL=ON
make -j
sudo make install

# config
mkdir ~/.config/sdlnp21kai

# font
sudo apt install -y fonts-takao-*
ln -s /usr/share/fonts/truetype/takao-gothic/TakaoGothic.ttf ~/.config/sdlnp21kai/default.ttf
