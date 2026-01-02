# game-database
一个简易的`GBA&NDS`游戏`ROM`和游戏存档云端仓库.  
(适用于`Ubuntu 22.04`操作系统)  
## 安装`FC`模拟器`fceux`
### 手动安装
可以使用如下的命令进行安装:  
```bash
sudo apt update
sudo apt install fceux
```
由于存档同步功能需要用到`rsync`,所以也需要安装`rsync`.  
```bash
sudo apt install rsync
```
### 脚本安装
```bash
./install-fceux.sh
```
### 运行`fceux`
安装完毕之后,使用如下命令运行.  
```bash
fceux
```
## 安装`GBA`模拟器`mGBA`
### 安装方式一:官网下载安装
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
### 安装方式二:使用`apt`进行安装
```bash
sudo apt install mgba-qt
```
安装完毕之后,使用如下命令运行.  
```bash
mgba-qt
```
## 安装`NDS`模拟器`melonDS`
### 手动安装
安装并生成可执行文件:  
```bash
sudo apt install cmake extra-cmake-modules libcurl4-gnutls-dev libpcap0.8-dev libsdl2-dev libarchive-dev libenet-dev libzstd-dev
sudo apt install qt6-base-dev
sudo apt install qt6-base-private-dev
sudo apt install qt6-multimedia-dev
sudo apt install libqt6svg6-dev
sudo apt install libvulkan-dev
sudo apt install libfaad-dev
cd ~/Downloads
git clone https://github.com/melonDS-emu/melonDS
cd melonDS
cmake -B build
cmake --build build -j$(nproc --all)
```
#### 解决`dpkg`错误
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
### 脚本安装
```bash
./install-melonDS.sh
```
## 运行`FC`模拟器并自动同步游戏`ROM`和游戏存档
```bash
./run-fc.sh
```
## 运行`GBA`模拟器并自动同步游戏`ROM`和游戏存档
```bash
./run-gba.sh
```
## 运行`NDS`模拟器并自动同步游戏`ROM`和游戏存档
```bash
./run-nds.sh
```
## 上传游戏`ROM`时的注意事项
`FC`模拟器无法打开`FC`游戏`ROM`压缩包,所以不压缩.  
针对于非`FC`游戏`ROM`请遵循如下规则:  
游戏`ROM`的文件名(`[filename]`)一律使用英文.  
将游戏`ROM`文件使用如下方式进行极致压缩:  
```bash
7z a -mx=9 [filename].7z [input path]
```
其中`[input path]`是游戏`ROM`(`.gba`/`.nds`)的文件路径.  
`[filename].7z`是要输出的游戏`ROM`压缩包.  
注意:上述操作中的`7z`命令可能需要安装才能使用,  
输入如下命令进行安装:  
```bash
sudo apt-get install p7zip-full
```
压缩完成之后,  
将压缩好的游戏`ROM`压缩包根据游戏发售平台的不同,  
放到对应的平台文件夹下:  
&emsp;&emsp;`FC`游戏的游戏`ROM`存放在`FC/`文件夹下,  
&emsp;&emsp;`GBA`游戏的游戏`ROM`压缩包存放在`GBA/`文件夹下,  
&emsp;&emsp;`NDS`游戏的游戏`ROM`压缩包存放在`NDS/`文件夹下.  
然后使用如下命令进行提交:  
```bash
./git-push.sh
```
遵循上述规则的原因:  
1. `github`免费仓库支持的容量上限为`1GB`  
2. `github`免费仓库支持上传的单个文件体积最大为`100MB`  
3. 游戏存档默认会生成在游戏`ROM`压缩包的同一目录下,  
而且文件名和游戏`ROM`压缩包一致,  
使用英文可以避免因操作系统编码和文件编码不一致而
造成文件名乱码以及存档加载异常等问题  
