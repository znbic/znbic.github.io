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
## 二、 系统设置

### （一） 应用安装
#### 1. zsh和oh my zsh
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


##### （2） code-server
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

#####  proot中运行libreoffice 可能报错


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
    ServerAliveInterval 60
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
vim ~/.vnc/xstartup # pkg install xrandr x11-repo,termux 好像没有，用xorg-xrnadr

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