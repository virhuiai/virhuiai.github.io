---
layout: post
title:  "使用ImageOptim压缩图片"
date:   2021-02-06 17:47:16 +0800
categories: 压缩 图片
rname-cmd: mv ./_posts/aaa.md ./_posts/2021-02-06-使用ImageOptim压缩图片.md
typora-root-url: ../
---

# 需求

写博客时，截图太大，加上日久天长硬盘空间捉襟见肘，想减小点图片的体积。

# 实现方案

使用ImageOptim 。

在线的图片压缩优化网站非常多，对于偶尔才压几张图的人群比较方便，毕竟只需浏览器即可完成处理。对于每天都要用到图片压缩，或更偏爱于使用原生应用，又可以省去上传下载的麻烦，也可以批量处理，更加高效一些。

![image-20210206175132752](/assets/2021-02-06-使用ImageOptim压缩图片.assets/image-20210206175132752.png)



```
官网地址
https://imageoptim.com/mac
https://github.com/ImageOptim/ImageOptim
```



 ImageOptim 可以实现无损画质的图片压缩优化，且小巧开源。



# 安装



```
brew cask install imageoptim
```



也可以选择下载安装方式。



![image-20210206175601315](/assets/2021-02-06-使用ImageOptim压缩图片.assets/image-20210206175601315.png)

默认的设置已经是最适用于「**无损压缩图片**」这个目的了，如果可以接受有损压缩的话，可以再设置下：

![image-20210206175809875](/assets/2021-02-06-使用ImageOptim压缩图片.assets/image-20210206175809875.png)

修改：

![image-20210206175850464](/assets/2021-02-06-使用ImageOptim压缩图片.assets/image-20210206175850464.png)

![image-20210206175937118](/assets/2021-02-06-使用ImageOptim压缩图片.assets/image-20210206175937118.png)

# 测试效果

准备一个文件夹，当前大小是1.1MB

![image-20210206174843668](/assets/2021-02-06-使用ImageOptim压缩图片.assets/image-20210206174843668.png)

文件夹直接拉过去：

![image-20210206180016442](/assets/2021-02-06-使用ImageOptim压缩图片.assets/image-20210206180016442.png)

等上一会：

![image-20210206180043116](/assets/2021-02-06-使用ImageOptim压缩图片.assets/image-20210206180043116.png)

直接查看下效果：

![image-20210206180121882](/assets/2021-02-06-使用ImageOptim压缩图片.assets/image-20210206180121882.png)

效果还是很优秀的。