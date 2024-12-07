# game-database
一个简易的`GBA&NDS`游戏`ROM`和游戏存档云端仓库.  
(适用于`Ubuntu 22.04`操作系统)  
## 安装`GBA`模拟器`mGBA`
`mGBA`模拟器官网下载地址:<https://mgba.io/downloads.html>  
选择对应的`Ubuntu`版本下载安装包即可.  
下载下来之后是`***.tar.xz`压缩包.  
使用归档管理器解压缩会得到3个`.deb`安装文件.  
右键点击其中的`mgba-qt.deb`选择`Open With Software Install`左键单击,  
如果没有没有上述的右键菜单选项,可以使用两种方式解决.  
1. 选择`Open With Other Application`选项左键单击,  
然后选择`Software Install`选项,点击`Select`按钮.  
2. 选择`Properties`选项左键单击,  
选中`Open With`选项卡,选中`Software Install`,然后点击`Set as default`按钮.  
(更改文件拓展名的默认打开应用)  

打开之后会有一段等待的时间,然后会打开应用商店跳转到`mGBA`应用页面,  
点击`Install`按钮,会跳出一个输入用户密码的页面,输入完用户密码,  
等待安装完毕即可.  
安装完毕之后,使用如下命令运行.  
```bash
mgba-qt
```
## 安装`NDS`模拟器`melonDS`
安装并生成执行文件:  
```bash
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
```
### 解决`dpkg`错误
如果在上述使用`sudo apt install`的时候出现如下错误:  
```bash
dpkg: error processing package shim-signed (--configure):
 installed shim-signed package post-installation script subprocess returned error exit status 127
Errors were encountered while processing:
 shim-signed
E: Sub-process /usr/bin/dpkg returned an error code (1)
```
解决方式:  
```bash
sudo mv /var/lib/dpkg/info /var/lib/dpkg/info.bak
sudo mkdir /var/lib/dpkg/info
sudo apt-get update
sudo apt-get install shim-signed
sudo mv /var/lib/dpkg/info/* /var/lib/dpkg/info.bak/
sudo rm -rf /var/lib/dpkg/info
sudo mv /var/lib/dpkg/info.bak /var/lib/dpkg/info
```
生成的可执行文件的路径:`~/Downloads/melonDS/build/melonDS`  
运行`melonDS`模拟器:  
```bash
~/Downloads/melonDS/build/melonDS
```
## 运行`GBA`模拟器并自动同步游戏`ROM`和游戏存档
```bash
./run-gba.sh
```
## 运行`NDS`模拟器并自动同步游戏`ROM`和游戏存档
```bash
./run-nds.sh
```
