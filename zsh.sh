###
# Description: zsh 安装
 # Author: AskeyNil
 # CreateDate: 2019-10-11 10:03:14
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


# 1. 导入依赖
source `curl https://raw.githubusercontent.com/AskeyNil/AskConfiguration/master/define.sh`

# 1. 判断 zsh 是否存在
if [ ! -e /usr/bin/zsh ]; then
    sudo apt install zsh -y
else
    success "\033[32m 安装成功 \033[0m"
fi
