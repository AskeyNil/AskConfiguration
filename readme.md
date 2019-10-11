# Ubuntu 下一些自动化安装脚本

> 所有安装均在 Ubuntu 16.04 下
> 以下脚本都默认已经安装过 curl 和更换了源，建议使用 Tsinghua 源



## 一键更换源脚本

```bash
wget https://raw.githubusercontent.com/AskeyNil/AskConfiguration/master/sources.sh
bash sources.sh
rm -rf sources.sh
```

### 安装 curl
> 如果运行一键更换脚本,则不需要运行此命令,在更换源脚本中已经安装了 curl
```bash
sudo apt install curl
```

## ros 安装脚本

```python
curl https://raw.githubusercontent.com/AskeyNil/AskConfiguration/master/ros.sh | bash
```

