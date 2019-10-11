#!/bin/bash
###
# Description: 自定义的一些方法
 # Author: AskeyNil
 # CreateDate: 2019-10-11 10:07:03
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


success() {
    printf "\033[32m [success] %s \033[0m \n" $1
}

failure() {
    printf "\033[31m [failure] %s \033[0m \n" $1
}

loading() {
    printf "\033[34m [loading] %s \033[0m \n" $1
}


install() {
    # 判断当前的软件是否已经存在
    is_install=`which $1`
    if [ $is_install ]; then
        success "$1 存在，无需再次安装"
    else
        loading "$1 不存在 开始安装"
        sudo rm -f /var/cache/apt/archives/lock
        sudo apt install -y $1
        success "$1 安装完成..."
    fi
}

install_sh() {
    if [ -e $1 ];then
        loading "开始执行 $1"
        bash $1
        success "$1 执行完毕"
    fi
}

#! $1为安装后在 dkpg 中检查的名称 $2 为安装包的名称 $3 为提示的名称
install_dpkg() {
    if [ -n "`dpkg -l | grep "$1"`" ]; then
        # body
        success "$3 已安装, 不需要重复安装"
        return
    fi
    # 删除锁
    sudo rm -f /var/lib/dpkg/lock
    count=0
    if [ ! -e deb/$2 ]; then
        failure "$3 的安装包不存在，请将 $3 安装包.deb文件放入到deb文件夹中"
        exit
    fi
    sudo dpkg -i deb/$2
    while [ $? != 0 ]; do
        let count++
        if [ $count == 5 ]; then
            failure "$3 安装失败，请手动尝试"
            exit
        fi
        loading "安装 $3 出现依赖问题，安装所需依赖"
        # 安装出现依赖问题
        sudo rm -f /var/cache/apt/archives/lock
        sudo apt install -yf
    done
}