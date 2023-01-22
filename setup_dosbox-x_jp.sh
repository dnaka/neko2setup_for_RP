#!/bin/bash

git clone https://github.com/joncampbell123/dosbox-x.git
cd dosbox-x
sudo apt install autogen automake libavformat-* libswscale-* libavcodec-*
sudo apt install libxext-dev libsdl2-dev nasm libncurses-dev
./build
./configure -enable-sdl2
make
sudo make install

# キーボード日本語化
# 下記URLをcloneして、jp.klとmapper-jp106.mapをdosbox-xのインストールフォルダ(/usr/local/share/dosbox-x)にコピー
# dosbox-x-jp.confを.config/dosbox-xにコピーして、machine=pc98指定を入れてdosbox-x.confにリネーム後再起動するとキーボードマップが日本語になる
cd ..
git clone https://github.com/vivian-ng/dosbox-x-jp
cd dosbox-x-jp
cp jp.kl /usr/local/share/dosbox-x
cp mapper-jp106.map /usr/local/share/dosbox-x
cp ~/.config/dosbox-x/dosbox-x-jp.conf ~/.config/dosbox-x
mv ~/.config/dosbox-x/dosbox-x.conf ~/.config/dosbox-x/dosbox-x.conf.org
mv ~/.config/dosbox-x/dosbox-x-jp.conf ~/.config/dosbox-x/dosbox-x.conf
cd ..