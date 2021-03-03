---
layout: post
title:  "Python安装HanLp时使用国内镜像加速3.6"
date:   2021-03-03 14:39:16 +0800
categories: 镜像 加速
rname-cmd: mv ./_posts/aa.md ./_posts/2021-03-03-Python安装库时使用国内镜像加速.md
typora-root-url: ../
---

# 下载Python镜像

```
docker pull python:3.6.13-buster
```

> Debian Buster 10.3 

# 运行

```
docker run -itd --name virhuiai-nlp-try python:3.6.13-buster
```

进入容器

```
docker exec -it virhuiai-nlp-try /bin/sh
```

# 提高 apt update 速度

```
# cat /etc/apt/sources.list
# deb http://snapshot.debian.org/archive/debian/20210208T000000Z buster main
deb http://deb.debian.org/debian buster main
# deb http://snapshot.debian.org/archive/debian-security/20210208T000000Z buster/updates main
deb http://security.debian.org/debian-security buster/updates main
# deb http://snapshot.debian.org/archive/debian/20210208T000000Z buster-updates main
deb http://deb.debian.org/debian buster-updates main
```

备份sources.list

```
mv /etc/apt/sources.list /etc/apt/sources.list.back.20210303
```

使用新的内容（没有安装vi、vim）

```
touch /etc/apt/sources.list
echo 'deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster main contrib non-free' >> /etc/apt/sources.list && \
echo '# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ buster main contrib non-free' >> /etc/apt/sources.list && \
echo 'deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-updates main contrib non-free' >> /etc/apt/sources.list && \
echo '# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-updates main contrib non-free' >> /etc/apt/sources.list && \
echo 'deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-backports main contrib non-free' >> /etc/apt/sources.list && \
echo '# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-backports main contrib non-free' >> /etc/apt/sources.list && \
echo 'deb https://mirrors.tuna.tsinghua.edu.cn/debian-security buster/updates main contrib non-free' >> /etc/apt/sources.list && \
echo '# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian-security buster/updates main contrib non-free' >> /etc/apt/sources.list
```

安装 常用的 vim mlocate unzip wget

```
set -eux; \
apt-get update && \
apt-get install -y --no-install-recommends \
vim \
mlocate \
unzip \
tree \
wget && \
rm -rf /var/lib/apt/lists/* && \
apt-get clean
```

更新文件索引

```
updatedb
```

# 国内镜像

## 临时方法

```
# 正常用法
pip3 install requests
 
# 加-i后使用指定镜像的用法
pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple requests
```

## 使用配置文件，一次解决

查看帮助：

```
# pip3 -h

Usage:   
  pip3 <command> [options]

Commands:
  install                     Install packages.
  download                    Download packages.
  uninstall                   Uninstall packages.
  freeze                      Output installed packages in requirements format.
  list                        List installed packages.
  show                        Show information about installed packages.
  check                       Verify installed packages have compatible dependencies.
  config                      Manage local and global configuration.
...
```

可知，使用config参数。

```
#pip3 config -h

Usage:   
  pip3 config [<file-option>] list
  pip3 config [<file-option>] [--editor <editor-path>] edit
  
  pip3 config [<file-option>] get name
  pip3 config [<file-option>] set name value
  pip3 config [<file-option>] unset name
  pip3 config [<file-option>] debug
。。。
```

看完说明，进行具体操作。

**查看当前源**

```
pip3 config list
# 这边返回是空的
```

设置国内的镜像源

```
# pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple/
Writing to /root/.config/pip/pip.conf
```

```
# pip3 config set global.trusted-host mirrors.aliyun.com
Writing to /root/.config/pip/pip.conf
```

查看设置后配置的变化：

````
# cat /root/.config/pip/pip.conf
[global]
index-url = https://pypi.tuna.tsinghua.edu.cn/simple/
trusted-host = mirrors.aliyun.com

# pip3 config list
global.index-url='https://pypi.tuna.tsinghua.edu.cn/simple/'
global.trusted-host='mirrors.aliyun.com'
````

## 常用镜像源

```
阿里云
http://mirrors.aliyun.com/pypi/simple/

清华大学
https://pypi.tuna.tsinghua.edu.cn/simple/

中国科技大学
https://pypi.mirrors.ustc.edu.cn/simple/

中国科学技术大学
http://pypi.mirrors.ustc.edu.cn/simple/

豆瓣
https://pypi.douban.com/simple/

华中理工大学：
http://pypi.hustunique.com/

山东理工大学：
http://pypi.sdutlinux.org/ 

新版ubuntu要求使用https源，要注意。
```

后面pip安装包时就可以看到速度的变化了。

# Hanlp-安装-使用阿里云镜像

```
https://github.com/hankcs/HanLP
```

海量级native API

依赖PyTorch、TensorFlow等深度学习技术，适合专业NLP工程师、研究者以及本地海量数据场景。要求Python 3.6以上，支持Windows，推荐*nix，可以在CPU上运行，推荐GPU/TPU。

```
pip3 install hanlp
```

![image-20210303151540273](/assets/2021-03-03-Python安装HanLp时使用国内镜像加速.assets/image-20210303151540273.png)

![image-20210303151729798](/assets/2021-03-03-Python安装HanLp时使用国内镜像加速.assets/image-20210303151729798.png)

```
# 换个源试下：
pip3 config set global.index-url https://mirrors.aliyun.com/pypi/simple/
pip3 config set global.trusted-host mirrors.aliyun.com
pip3 install hanlp
```

![image-20210303152710979](/assets/2021-03-03-Python安装HanLp时使用国内镜像加速.assets/image-20210303152710979.png)

速度果然提升不少：

![image-20210303152813108](/assets/2021-03-03-Python安装HanLp时使用国内镜像加速.assets/image-20210303152813108.png)

失败

![image-20210303153636159](/assets/2021-03-03-Python安装HanLp时使用国内镜像加速.assets/image-20210303153636159.png)

查到：

<img src="/assets/2021-03-03-Python安装HanLp时使用国内镜像加速.assets/image-20210303153815824.png" alt="image-20210303153815824" style="zoom:50%;" />

和

<img src="/assets/2021-03-03-Python安装HanLp时使用国内镜像加速.assets/image-20210303153942840.png" alt="image-20210303153942840" style="zoom:50%;" />

尝试：

```
pip3 --no-cache-dir install hanlp
```

最终：

![image-20210303154923726](/assets/2021-03-03-Python安装HanLp时使用国内镜像加速.assets/image-20210303154923726.png)

使用最后的备用方案：

```
# 离线下载：
https://mirrors.aliyun.com/pypi/packages/90/4f/acf48b3a18a8f9223c6616647f0a011a5713a985336088d7c76f3a211374/torch-1.7.1-cp36-cp36m-manylinux1_x86_64.whl
再到相应的下载目录，安装
pip3 install torch-1.7.1-cp36-cp36m-manylinux1_x86_64.whl
```

![image-20210303154945377](/assets/2021-03-03-Python安装HanLp时使用国内镜像加速.assets/image-20210303154945377.png)

拷贝本地文件到容器：

```
docker cp 本地路径 容器名或ID:容器路径
```

在外面的机子运行：

```
docker cp /Volumes/RamDisk/torch-1.7.1-cp36-cp36m-manylinux1_x86_64.whl virhuiai-nlp-try:/root/
```

在容器中`/root`查看:

```
# ls -hl
total 741M
-rwxrwxrwx 1 501 dialout 741M Mar  3 07:54 torch-1.7.1-cp36-cp36m-manylinux1_x86_64.whl
```

安装：

```
pip3 install torch-1.7.1-cp36-cp36m-manylinux1_x86_64.whl
```

![image-20210303155832297](/assets/2021-03-03-Python安装HanLp时使用国内镜像加速.assets/image-20210303155832297.png)

这儿pip3就是pip。

删除无用的文件：

```
rm torch-1.7.1-cp36-cp36m-manylinux1_x86_64.whl
```

> 另外的超时设置未试过:
>
> ```
> --default-timeout=6000单位是秒
> ```

# Hanlp-快速上手

官方说明：

```
import hanlp
HanLP = hanlp.load(hanlp.pretrained.mtl.CLOSE_TOK_POS_NER_SRL_DEP_SDP_CON_ELECTRA_SMALL_ZH) # 世界最大中文语料库
HanLP(['2021年HanLPv2.1为生产环境带来次世代最先进的多语种NLP技术。', '阿婆主来到北京立方庭参观自然语义科技公司。'])
```

存在问题：下载慢！

```
Downloading https://file.hankcs.com/hanlp/mtl/close_tok_pos_ner_srl_dep_sdp_con_electra_small_20210111_124159.zip to /root/.hanlp/mtl/close_tok_pos_ner_srl_dep_sdp_con_electra_small_20210111_124159.zip
```

解决，离线下载后，拷贝到容器：

```
# 在宿主机
docker cp /Volumes/RamDisk/close_tok_pos_ner_srl_dep_sdp_con_electra_small_20210111_124159.zip virhuiai-nlp-try:/root/.hanlp/mtl/
```

接着重新尝试：

![image-20210303160941774](/assets/2021-03-03-Python安装HanLp时使用国内镜像加速.assets/image-20210303160941774.png)

会解压，后面还有下载：

![image-20210303161038429](/assets/2021-03-03-Python安装HanLp时使用国内镜像加速.assets/image-20210303161038429.png)

![image-20210303161346063](/assets/2021-03-03-Python安装HanLp时使用国内镜像加速.assets/image-20210303161346063.png)

```
https://file.hankcs.com/hanlp/mtl/close_tok_pos_ner_srl_dep_sdp_con_electra_small_20210111_124159.zip
```

