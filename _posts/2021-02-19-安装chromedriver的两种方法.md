---
layout: post
title:  "安装chromedriver的两种方法"
date:   2021-02-19 18:48:16 +0800
categories: 爬虫
rname-cmd: mv ./_posts/aaa.md ./_posts/2021-02-19-安装chromedriver的两种方法.md
typora-root-url: ../
---

使用的机器，Mac

# 法一：Brew Install

```bash
brew cask install chromedriver
```

如：

```
virhuiaivirhuiai@virhuiaideMacBook-Pro docker.demo % brew cask install chromedriver
==> Downloading https://chromedriver.storage.googleapis.com/83.0.4103.39/chromedriver_mac64.zip
```

缺点：不一定就是当前的浏览器版本，就像我当前就因为浏览器升级了要更换：

![image-20210219185358951](/assets/2021-02-19-安装chromedriver的两种方法.assets/image-20210219185358951.png)

# 法二：手动安装

查看你电脑上浏览器的版本：

![image-20210219185501727](/assets/2021-02-19-安装chromedriver的两种方法.assets/image-20210219185501727.png)

新版本是 88.0.4324， 重启下，打开

```
http://chromedriver.storage.googleapis.com/index.html
```

![image-20210219185623345](/assets/2021-02-19-安装chromedriver的两种方法.assets/image-20210219185623345.png)

打开我们浏览器版本和操作系统版本的下载：

![image-20210219185731313](/assets/2021-02-19-安装chromedriver的两种方法.assets/image-20210219185731313.png)

我的本子不是m1的，就选第二个就好。

解压后，移动：

```
mv /Volumes/RamDisk/chromedriver /usr/local/bin/chromedriver
```

# 设置安全性

此后要设置安全性，否则会弹出：

![image-20210219190147210](/assets/2021-02-19-安装chromedriver的两种方法.assets/image-20210219190147210.png)

设置，安全性与隐私

![image-20210219190245737](/assets/2021-02-19-安装chromedriver的两种方法.assets/image-20210219190245737.png)

在通用这边，选择仍然允许：

![image-20210219190331107](/assets/2021-02-19-安装chromedriver的两种方法.assets/image-20210219190331107.png)

再次运行selenium，弹出的就会多个按钮，选中间的打开

![image-20210219190442178](/assets/2021-02-19-安装chromedriver的两种方法.assets/image-20210219190442178.png)

