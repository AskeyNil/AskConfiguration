#!/bin/bas
###
# Description: 更换源
 # Author: AskeyNil
 # CreateDate: 2019-09-25 11:25:23
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


# 1. 下载源文件
wget https://raw.githubusercontent.com/AskeyNil/AskConfiguration/master/sources.list

# 2. 判断 sources 是否下载成功
if [ -d sources.list ]; then
    printf "\033[31msources.list 不存在,请重试...\033[0m\n"
    exit
fi

# 3. 比较两个源文件是否一致
diff -qB sources.list /etc/apt/sources.list

if [ $? != 0 ];then
    printf "\033[31m当前源不一致 执行替换源操作\033[0m \n"
    # ?两个文件不一样
    # 给原来的源文件做一个备份
    sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
    # 将当前的 Tsinghua.list 拷贝到该目录
    sudo cp sources.list /etc/apt/sources.list
else
    printf "\033[32m当前源和更换的源一致，无需更换\033[0m \n"
fi

# 4. 删除下载的源文件
rm -rf sources.lis*

# 5. 更新源
sudo rm -f /var/lib/apt/lists/lock
sudo apt update

# 6. 安装 curl
sudo rm -f /var/lib/dpkg/lock
sudo rm -f /var/cache/apt/archives/lock
sudo apt install curl -y