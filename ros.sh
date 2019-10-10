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


# ? 切换到当前脚本目录
cd `dirname $0`

# 更换 Tsinghua 源
# 1. 检查当前源是否是Tsinghua 源
# 1.1 比较两个文件是否一致
diff -qB Tsinghua.list /etc/apt/sources.list
if [ $? != 0 ];then
    echo "当前源不一致 执行替换源操作"
    # ?两个文件不一样
    # 1.2 给原来的源文件做一个备份
    sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
    # 1.3 将当前的 Tsinghua.list 拷贝到该目录
    sudo cp Tsinghua.list /etc/apt/sources.list
else
    echo "当前源和更换的源一致，无需更换"
fi

# 1.2 更新源
sudo rm -f /var/lib/apt/lists/lock
sudo apt update

# 2. 添加 ros 源
# 2.1 添加 Tsinghua ros源
sudo sh -c '. /etc/lsb-release && echo "deb http://mirrors.tuna.tsinghua.edu.cn/ros/ubuntu/ $DISTRIB_CODENAME main" > /etc/apt/sources.list.d/ros-latest.list'
# 2.2 设置秘钥
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
# 2.3 更新源
sudo apt update

# 3. 安装 ros
sudo rm -f /var/lib/dpkg/lock
sudo rm -f /var/cache/apt/archives/lock
sudo apt install ros-kinetic-desktop-full -y

# 4. 初始化 rosdep
sudo rosdep init
rosdep update

# 5. 添加环境变量
# 5.1 bashrc
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc
# 5.2 zshrc
# 判断是否有 zsh
# echo "source /opt/ros/kinetic/setup.zsh" >> ~/.zshrc
# source ~/.zshrc

# 6. 构建工厂依赖
sudo rm -f /var/lib/dpkg/lock
sudo rm -f /var/cache/apt/archives/lock
sudo apt install python-rosinstall python-rosinstall-generator python-wstool build-essential -y

source ~/.bashrc
