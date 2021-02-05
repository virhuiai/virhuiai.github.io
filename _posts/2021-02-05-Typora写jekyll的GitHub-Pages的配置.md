---
layout: post
title:  "Typora写jekyll的GitHub-Pages的配置"
date:   2021-02-05 20:41:07 +0800
categories: Typora jekyll GitHub-Pages

typora-root-url: ../../virhuiai.github.io.git
---

本文主要解决图片的显示问题，思路是使用相对路径。

# 设置Typora的图片根目录

![image-20210205204438077](/assets/2021-02-05-Typora写jekyll的GitHub-Pages的配置.assets/image-20210205204438077.png)

选择到GitHub Pages仓库的根目录：

![image-20210205204459478](/assets/2021-02-05-Typora写jekyll的GitHub-Pages的配置.assets/image-20210205204459478.png)

设置后，会在当前文档的开头添加：



```
typora-root-url: ../../virhuiai.github.io.git
```



![image-20210205204536215](/assets/2021-02-05-Typora写jekyll的GitHub-Pages的配置.assets/image-20210205204536215.png)



# 设置图片自动复制

![image-20210205204551595](/assets/2021-02-05-Typora写jekyll的GitHub-Pages的配置.assets/image-20210205204551595.png)

设置图片规则：

![image-20210205204607767](/assets/2021-02-05-Typora写jekyll的GitHub-Pages的配置.assets/image-20210205204607767.png)

第一个选择：复制到指定路径。

第二个选择输入自定义参数：

```
/Users/virhuiaivirhuiai/Documents/virhuiai-github/virhuiai.github.io.git/assets/${filename}.assets

或者

../assets/${filename}.assets
```

第三个选择：优先使用相对路径。

这样设置后，Typora中正常显示图片，在jekyll中也能正常显示图片。