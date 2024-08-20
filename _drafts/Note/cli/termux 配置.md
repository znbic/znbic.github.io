# 配置termux图形界面
---

## Ubuntu

```sh
pkg install proot-distro
proot-distro install ubuntu
```

## 登录 Ubuntu
proot-distro login ubuntu


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

```sh
pkg install xfce4-terminal
```



#### tmux

```sh
# 启用鼠标支持
set -g mouse on

# 启用系统剪贴板
set-option -g set-clipboard on
```

```sh
tmux source-file ~/.tmux.conf
```

#### VS CODE

```sh
apt install code-oss
```
set the termial copy 

```sh
terminal.integrated.copyonselection
```


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

开启选择复制
```sh
terminal.integrated.copyonselection
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

##### 显示中文

```sh
git config --global core.quotepath false
git config --global i18n.commitencoding utf-8
git config --global i18n.logoutputencoding utf-8

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
##### Powerlevel10k


```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
```


```
exec zsh
```


```
p10k configure
```

添加当前用户到提示符（可以不弄）

```
vim ~/.p10k.zsh
```

User取消注释，没有自己加
```
typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    # =========================[ Line #1 ]=========================
    # os_icon               # os identifier
    dir                     # current directory
    vcs                     # git status
    # =========================[ Line #2 ]=========================
    newline                 # \n
    # prompt_char           # prompt symbol
    user                    # user
  )
```

```sh
source ~/.zshrc
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


##### 关闭后台进程限制

```sh
adb shell settings put global settings_enable_monitor_phantom_procs false #恢复的话改 true
```


#### VNC

#### （1） 服务器
```sh
apt install tigervnc # 需要 x11-repo,xfce4-session
```


```
vncserver :1 -localhost no
export DISPLAY=:1
startxfce4
```
#### （2） 客户端
打开VNC Viewer
```
Address 127.0.0.1：5901 # 5900+1
```

#### novnc

```sh
git clone https://github.com/novnc/noVNC.git
```

```sh
./utils/novnc_proxy --vnc localhost:5901
```

####  xfce

##### 任务管理器
```
apt install xfce4-taskmanager
```

#### 输入法

baidu ime

#### LibreOffice


