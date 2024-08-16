# 配置termux图形界面
---
%% 
## root
pkg install proot-distro
proot-distro install ubuntu
## 登陆Ubuntu
proot-distro login ubuntu

%%

---
## [安装桌面](https://b23.tv/p4iOwue)
apt install x11-repo
apt install termux-x11-nightly
## 启动
termux-x11 :0 &>/dev/null &
export DISPLAY=:0
startxfce4(如果报错就apt install libexpat，有的设备缺文件)
打开Termux：x11

---
## VNC
apt install tigervnc
vncserver :1 -localhost no
export DISPLAY=:1
startxfce4
打开VNC viewer
填写：
127.0.0.1：（5900+1）

---
## 启动脚本
apt install mousepad（文本编辑器，我大概不需要）
路径: %PATH/startx11(/data/data/com.termux/files/usr/bin/)
### *脚本*
```bash
#!/bin/bash

# Set the display environment variable
export DISPLAY=:0

# Start the Termux-X11 server in the background, suppressing output
termux-x11 :0 &>/dev/null &

# Wait for 3 seconds to ensure the X11 server is up and running
sleep 3

# Start the XFCE4 desktop environment in the background, suppressing output
startxfce4 &>/dev/null &

# Launch the Termux-X11 MainActivity using the Android activity manager
am start --user 0 -n com.termux.x11/.MainActivity &>/dev/null


```
### *VNC脚本（暂时没用上）*
```bash
#!/bin/bash

# Start the VNC server on display :1 with specified geometry and no localhost restriction
vncserver :1 -localhost no -geometry 1280x720

# Wait for the VNC server to start
wait

# Set the display environment variable to :1
export DISPLAY=:1

# Allow connections to the X server from any host
xhost +

# Wait for 1 second to ensure the display is ready
sleep 1

# Start the XFCE4 desktop environment in the background, suppressing output
startxfce4 &>/dev/null &

# Launch the RealVNC Viewer Android app using the Android activity manager
am start --user 0 -n com.realvnc.viewer.android/.app.ConnectionChooserActivity &>/dev/null


```

---
## 应用安装
#### terminal

pkg install xfce4-terminal

#### code-server
%%
##### ~~暂时没用上~~
```
curl -Lk 'https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64' --output vscode_cli.tar.gz
```

```
tar -xf vscode_cli.tar.gz -C /data/data/com.termux/files/usr/bin/

```


```
code tunnel
```
 ##### ~~没用上到此为止~~
 %%
 
##### 实际使用
```
pkg install tur-repo
```

```
pkg install code-server
```

```
code-server --auth none
```

#### Blog

```bash
pkg install ruby
gem install bundler jekyll
```

#### Git

```bash
Your identification has been saved in /data/data/com.termux/files/usr/etc/ssh/ssh_host_ecdsa_key
Your public key has been saved in /data/data/com.termux/files/usr/etc/ssh/ssh_host_ecdsa_key.pub

```


#### Browser
```sh
pkg install otter-browser
```

#### zsh和oh my zsh
```sh
pkg install zsh
```

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```


#### ADB

```sh
pkg install android-tools

```

adb配对

```bash
adb pair 192.168.1.101:41733
```

adb连接（注意端口变化）
```
adb connect 192.168.1.101:40505
```
##### 关闭后台进程限制(暂时不弄了)

```sh
./adb shell "/system/bin/device_config set_sync_disabled_for_tests persistent; /system/bin/device_config put activity_manager max_phantom_processes 2147483647"
```


