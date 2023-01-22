# PC-98Emulator Setup script for Raspbery Pi4B

Raspbery Pi 4BにPC-98エミュレータであるNeko Project2kaiとDosbox-xをインストールするスクリプトです。  
ただし、スクリプト実行だけでは動作できる所まで行かないので、このドキュメントも合わせて参照してください。

## Neko Project2kai (X-Server版)

### 事前準備

- 実機BIOSを用意します。
  - http://retropc.net/yui/np2tool/index.html から np2_getbios.zipとnp2_makefont.zipをダウンロードして展開します。
  - 展開してできるGETBIOS.COMとMAKEFONT.EXEを何らかの方法でPC-98実機上で動作するメディアにコピーします。
    - 3.5インチFDDやSCSI-2のMOドライブあたりが現行機とPC-98実機の両方で使用できれば、比較的簡単にコピーできます・・・。
  - PC-98実機上でGETBIOS.COMとMAKEFONT.EXEを実行するとbios.rom, sound.rom, font.rom, font.bmpが生成されるので、それを上記メディアにコピーして現行機に持ってきます
  - PC-98実機でHMAやUMBを有効にしていると、sound.romが作成されない事があります。起動時にそれらのオプションを無効にしてください。
- PC-98のサウンドを再現するwaveファイルを入手します。
  - https://sound.jp/jaime/fmp_top.html のYM2608風リズム音源データをDLして展開しておきます。

一応、ROMファイルやwaveファイルはなくても動作しますが、動作が実機に近くなったり、フォントがオリジナルに近くなります。

### インストール

- Raspbery Pi上でこのリポジトリをcloneして、setup_np2kai_x.shを実行します
  - かなり時間がかかるので注意。CPUファンをつけて冷却してやらないと厳しいかもしれません

### 外部ファイルのコピー

- インストールが完了したら、用意した実機BIOSファイルとリズム音源データファイルを一旦USBメモリなどにコピーし、そこからRaspbery Pi上の~/.config/xnp21kaiにコピーします
  - ファイル名は全て小文字で統一してください
- 実機FDDやHDDのイメージファイルを用意します
  - 詳しくはNeko projectのマニュアルを参照してください
    - PC-98用MS-DOSがない人は98用FreeDOSを利用してください。
      - http://mwlab.net/2011/11/pc-98-emu-hdd-image.html などでFreeDOSのHDDイメージが公開されています
  - 慣れてくるとこの辺のツールが便利だと思います
    - http://www.vector.co.jp/soft/win95/util/se151106.html
    - https://hp.vector.co.jp/authors/VA013937/editdisk/index.html

### 起動

- メニューからxnp21kaiを選択するか、シェルでxnp21kaiを実行してください

## Neko Project2kai (SDL版)

### インストール

行するスクリプトがsetup_np2lai_sdl.shになるのと、BIOSや音源データファイルの保存先が ~/.config/sdlnp21kai になる以外はインストール手順はX-Server版と同じです。
SDL版なので、Pi OSの設定でX-Serverを停止してコマンドライン画面にした後、sdlnp21kaiコマンドで起動します。
ただし、こちらはちゃんとした動作確認ができていませんので、自己責任でお願いします。

## Dosbox-x

### インストール

- setup_dosbox-x_jp.shを実行します
  - かなり時間がかかるので注意。CPUファンをつけて冷却してやらないと厳しいかもしれません

### confの変更

- ~/.config/dosbox-x/ をエディタで開き、machine指定をpc98に書き換えて保存します。
  - `machine = svga_s3　→　machine = pc98`

### 外部ファイルのコピー

- dosbox-xはRaspbery Pi上のフォルダをPC-98のCドライブとしてmountします。そのため、PC-98用の各ファイルを直接Raspbery Pi4上にコピーしてください。  
  - dosbox-xは独自にDOSを持っているため、MS-DOSやFreeDOSは不要です。また、実機BIOSファイルも必要ありません。


### 起動

- Pi OSでシェルを開き、dosbox-xを実行します
- エミュレーションウィンドウが表示されるはずなので、以下のコマンドでマウントしてください。pathがファイルを置いたフォルダになります
  - `mount c [pash]`
- `c:` コマンドでCドライブに移動して、通常のDOSコマンドラインとして使用できるはずです
