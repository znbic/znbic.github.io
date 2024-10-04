# 配置termux图形界面

---

## Ubuntu

### proot

```sh
pkg install proot-distro
proot-distro install ubuntu
```

### 登录 Ubuntu

```sh
proot-distro login ubuntu
passwd
```

#### （一） 添加用户

```
adduser 用户名 #tree # apt install passwd sudo adduser
sudo usermod -aG sudo,adm,cdrom,plugdev,lpadmin,netdev <username>
```

- **-a**：表示追加（append），将用户添加到指定的组，而不是替换用户当前所属的组。
- **-G**：指定要添加用户的组列表，多个组之间用逗号分隔。
- **sudo**：组名，表示超级用户组。将用户添加到这个组后，用户可以使用`sudo`命令来执行需要超级用户权限的操作。
- **adm**：组名，表示系统管理员组。将用户添加到这个组后，用户可以访问系统日志文件等管理功能。
- **cdrom**：允许用户访问 CD-ROM 驱动器。
- **plugdev**：允许用户管理可移动设备。
- **lpadmin**：允许用户管理打印机。
- **netdev**：允许用户管理网络设备。

#### （二） 变更用户

```
su - 用户名    # If can't use sudo, visudo 
              # in root(export EDITOR=vim), 
              # and then add a line like 
              # <username> ALL ...

```

## mobox

**install**

```
curl -s -o ~/x https://raw.githubusercontent.com/olegos2/mobox/main/install && . ~/x
```

**桌面环境启动mobox**

```
 vim ../usr/glibc/opt/scripts/start-tfm # 记得cp -a 备份
```

```
# 第20行注释stop-all、220行注释掉stop-all

# 删除最后三处（第187、188、189行）“explorer /desktop=shell,$RESOLUTION”

```

## 二、 系统设置

### （一） 应用安装

#### 1. `zsh`和`oh my zsh`

```sh
sudo apt install zsh # apt insall sudo
```

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

##### （1）Powerlevel10k

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

##### （2）plugin install

```sh

# ${ZSH_CUSTOM:-~/.oh-my-zsh/custom} means “use the value of ZSH_CUSTOM if it is set; otherwise, use ~/.oh-my-zsh/custom.”

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

```

```

# vim .zshrc
plugins=( 
    # other plugins...
    zsh-autosuggestions
)
```

#### 2. code-server

###### 下载

```sh
curl -fsSL https://code-server.dev/install.sh | sh
```

###### 允许外部访问

```sh
vim ~/.config/code-server/config.yaml # 没有文件的话，先启动一次
```

```sh
bind-addr: 0.0.0.0:8080
```

#### 2. VNC

##### （1） 服务器

```sh
# sudo apt-get install dbus-x11
apt install tightvncserver
```

```bash
# 启动 VNC 服务器并设置密码
vncserver :1
```

设置桌面比如（xfce、kd、gnome）会用到的变量，这告诉了哪个vnc服务中启动桌面。

```sh
export DISPLAY=：1
```

##### proot中运行libreoffice 可能报错

```sh
apt install xorg-xhost # 
```

```sh
xhost + # 这条命令可以允许VNC允许来自任何地方的连接
```

##### （2） 客户端

打开VNC Viewer

```
Address 127.0.0.1：5901 # 5900+1
```

##### novnc

```sh
git clone https://github.com/novnc/noVNC.git
```

```sh
./utils/novnc_proxy --vnc localhost:5901
```

##### Encrypt novnc

###### linux

```sh
apt install certbot
```

```shell
certbot certonly --standalone -d domain_name
```

Certbot will create the necessary certificate files in `/etc/letsencrypt/live/domain_name/`.

```shell
websockify --web /path/to/noVNC --cert /etc/letsencrypt/live/domain_name/fullchain.pem --key /etc/letsencrypt/live/domain_name/privkey.pem 6080 localhost:5901
```
**Auto renewal of Let's Encrypt**

```sh
crontab -e
```

```sh
# add this line to renew certificate twice a day
0 0,12 * * * root certbot renew --quiet --post-hook "systemctl reload nginx"
```

###### termux

acme.sh

```sh
git clone https://github.com/acmesh-official/acme.sh.git
cd ./acme.sh
./acme.sh --install -m my@example.com # add email to get notification of your encrypt status.
```

```sh
acme.sh --issue --standalone -d domain_name # .acme.sh/domain_name
```

```shell
websockify --web /path/to/noVNC --cert ~/.acme.sh/domain_name/fullchain.cer --key ~/.acme.sh/domain_name/domain_name.key 6080 localhost:5901

```
auto update
```sh
acme.sh --install-cronjob
```

###### self-signed

etc/ssl/mycerts
.ssl/mycerts
path/to/application/certs
```sh
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -nodes
```
key.pem: The private key file.
cert.pem: The certificate file.
365 days: The certificate will be valid for one year.

```
websockify --web /path/to/noVNC --cert /path/to/cert.pem --key /path/to/key.pem 6080 localhost:5901
# pip install websockify # if apt install failed
# export CMAKE_ARGS="-DRUN_NINJA_TEST=FALSE" if pip install failed. Because ninja test may fail in termux.
# pip install  clang cmake make python-pip numpy# python-dev build-essential
# pip install --no-cache-dir numpy
# apt install ninja coreutils libffi-dev rust 
####################
# WHY? Because python pip sometimes doesn't have binary code, only has source. So it have to compile it by itself.
```


#### 桌面环境

##### gnome

安装桌面环境所需的软件包，包括系统面板、窗口管理器、文件浏览器、终端等桌面应用程序。

```sh
sudo apt install gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal ubuntu-desktop
```

```

pkg install xorg-server


```

#### neofetch

```sh
apt install neofetch # 
```

share folder

```sh
proot-distro login ubuntu --shared-tmp
export DSPLAY=:1
```

### （二） zshrc

#### 1. 安全删除

##### （1） 新建垃圾桶

```
touch ~/.trash
```

##### （2） zshrc添加

```
alias rm='mv -t ~/.trash'
注意等号两边不要加空格
```

#### 2. ssh保持连接（可以不搞）

##### （1） SSH配置文件修改

```bash
sudo vim /etc/ssh/sshd_config
```

##### （2） 修改参数为

```bash
ClientAliveInterval 60
ClientAliveCountMax 3

```

##### （3） 重启SSH服务

```sh
sudo systemctl restart sshd
```

## 三、客户端

#### （一） ssh设置

##### 1. ssh保持连接（可以不搞）

```sh
vim ~/.ssh/config
```

```bash
Host 名称
    ServerAliveInterval 60 #连接老是断的情况下，调小数字
    ServerAliveCountMax 3
```

##### 2.  ssh连接简化

```sh
Host pzen
        HostName server_ip
        User root #或者新建的用户名
        Port 22 # 默认22,所以可以不要这行。termux为8022
        IdentityFile ~/../usr/etc/ssh/ssh_host_rsa_key
        ServerAliveInterval 60
	    ServerAliveCountMax 3
```

##### 3. 公钥放进服务器

```
ssh-copy-id -i ~/../usr/etc/ssh/ssh_host_rsa_key.pub root@server_ip # -p 8022
																	# 如果服务器是
																	# termux
```

# 待整理

## 1

libreoffice startedd but permission denied

apt install xorg-xhost然后再xhost +这样就能开放VNC的权限了，然后再proot-distro里面设置DISPLAY变量

## 2

分辨率不行

`xrandr`

```
vim ~/.vnc/xstartup # pkg install xrandr x11-repo,termux 好像没有，用xorg-xrandr

```

```
#!/bin/sh
xrandr --output VNC-0 --mode auto
startxfce4 &



```

## 声音

```
sudo apt install pipewire-pulse  
sudo apt install pavucontrol #声音GUI
```

```
# 查看声卡ID
pactl list sources short

```

```
pulseaudio
```

## 胡乱设置display后复原

```
rm -rf ~/.config/xfce4/panel
 rm  ~/.config/xfce4/panel  
 rm -rf ~/.config/xfce4/xfconf/xfce-perchannel-xml
 rm ~/.config/xfce4/xfconf/xfce-perchannel-xml                 
 ./startdesktop.zsh

```

## 中文输入法

```
fcitx5 fcitx5-chinese-addons
fcitx5 -d
```


## 声音

```shell
pactl list short sinks   # list available sinks 
pactl list short modules # list all available sources and sinks


```

```
pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth anoymous=1" --exit-idle-time=-1
```

## tldr

```
npm install -g tldr #termux用这个很卡

```

```
pkg install tealdeer # termux
```

## termux clipboard set

### 1. 暂时不弄的方法

**vim using termux clipboard**

```sh
pkg install termux-api

```

**Use Clipboard Commands in Vim:**

copy text to the clipboard:

```sh
:w !termux-clipboard-set
```

To paste from the clipboard into Vim:

```sh
:r !termux-clipboard-get
```

### 2. xclip

```
apt install xclip
```

**.tmux.conf**

```
# 使用 xclip
bind -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel "xclip -i -selection clipboard"



```

```
tmux source-file ~/.tmux.conf
```

**.vimrc**

```
set clipboard=unnamedplus
```

## telegram

check dbus

```sh
dbus-send --session --dest=org.freedesktop.DBus --type=method_call --print-reply /org/freedesktop/DBus org.freedesktop.DBus.ListNames

```

```sh
# [flatpak](https://flathub.org/setup/Ubuntu)
# If dbus error, using sudo maybe can solve.Or
# `eval $(dbus-launch --sh-syntax)` may solve.

sudo apt install flatpak
sudo apt install gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo


# install telegram

sudo flatpak install flathub org.telegram.desktop

# set XDG_DATA_DIRS (a variable that defines the search paths 
# for data files used by applications on your system).
# `:$XDG_DATA_DIRS` will make sure XDG_DATA_DIRS will append new values into XDG_DATA_DIRS
export XDG_DATA_DIRS=/var/lib/flatpak/exports/share:/home/tree/.local/share/flatpak/exports/share:$XDG_DATA_DIRS

# run telegram
flatpak run org.telegram.desktop


```
