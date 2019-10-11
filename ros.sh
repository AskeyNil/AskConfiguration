#!/bin/bash
###
# Description: ros 的一键安装脚本
 # Author: AskeyNil
 # CreateDate: 2019-10-10 21:15:31
 # LastEditors: AskeyNil
 #
 # *********************************
 # **                             **
 # **     　  你只有足够努力     　  **
 # **       才能看上去毫不费力       **
 # **                             **
 # *********************************
 #
 ###

# 1. 添加 ros 源
# 1.1 添加 Tsinghua ros源
sudo sh -c '. /etc/lsb-release && echo "deb http://mirrors.tuna.tsinghua.edu.cn/ros/ubuntu/ $DISTRIB_CODENAME main" > /etc/apt/sources.list.d/ros-latest.list'
# 1.2 设置秘钥
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
# 1.3 更新源
sudo rm -f /var/lib/apt/lists/lock
sudo apt update

# 2. 安装 ros
sudo rm -f /var/lib/dpkg/lock
sudo rm -f /var/cache/apt/archives/lock
sudo apt install ros-kinetic-desktop-full -y

# 3. 初始化 rosdep
sudo rosdep init
rosdep update

# 4. 添加环境变量
# 4.1 bashrc
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc
# 4.2 zshrc
# 判断是否有 zsh
# echo "source /opt/ros/kinetic/setup.zsh" >> ~/.zshrc
# source ~/.zshrc

# 5. 构建工厂依赖
sudo rm -f /var/lib/dpkg/lock
sudo rm -f /var/cache/apt/archives/lock
sudo apt install python-rosinstall python-rosinstall-generator python-wstool build-essential -y

source ~/.bashrc
