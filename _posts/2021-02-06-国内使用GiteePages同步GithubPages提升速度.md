---
layout: post
title:  "国内使用GiteePages同步GithubPages提升速度"
date:   2021-02-06 19:16:16 +0800
categories: git blog
rname-cmd: mv ./_posts/aa.md ./_posts/2021-02-06-国内使用GiteePages同步GithubPages提升速度.md
typora-root-url: ../
---

# 现状

在GitHub上用

```
https://github.com/virhuiai/virhuiai.github.io.git
```

创建了着GitHub Pages:

```
https://virhuiai.github.io/
```

这部分的可以参见我之前写的[教程](https://www.toutiao.com/i6925749141444264459/)（用Jekyll创建GitHubPages完整版-用户站版）：

# 存在问题

不科学上网的情况，`https://virhuiai.github.io/`是访问不了的，不过github提交还是可以的。

# 解决方案

用Gitee同步GitHub。下面记录实战步骤：

# 1: 新建同步仓库

第一步，到gitee打开新建仓库页面（注册不用教了哈）：

```
https://gitee.com/projects/new
```

第二步，先填写导入已有仓库的，其中路径和`用户名`要一样，这点和GitHub上有所不同，GitHub上是要写

```
virhuiai.github.io.git
```

然后仓库就是

```
https://github.com/virhuiai/virhuiai.github.io.git
```

Gitee上是写

```
virhuiai
```

仓库是：

```
https://gitee.com/virhuiai/virhuiai
```



![image-20210206192416710](/assets/2021-02-06-国内使用GiteePages同步GithubPages提升速度.assets/image-20210206192416710.png)

# 2: 生成Gittee Pages

在仓库项目页，点**服务**，再点**Gitee Pages** :

![image-20210206192724439](/assets/2021-02-06-国内使用GiteePages同步GithubPages提升速度.assets/image-20210206192724439.png)

开启后再点这边是：

![image-20210206192834519](/assets/2021-02-06-国内使用GiteePages同步GithubPages提升速度.assets/image-20210206192834519.png)

在仓库面的右边，也可以直接点进去：

![image-20210206192912409](/assets/2021-02-06-国内使用GiteePages同步GithubPages提升速度.assets/image-20210206192912409.png)

# 3: 查看效果

![image-20210206193003388](/assets/2021-02-06-国内使用GiteePages同步GithubPages提升速度.assets/image-20210206193003388.png)

# 4: 更新

只要仓库更新了，GiteePages也会自动更新：

![image-20210206193132301](/assets/2021-02-06-国内使用GiteePages同步GithubPages提升速度.assets/image-20210206193132301.png)

另外Gitee的仓库里也和GitHub一样，能直接看到MarkDown文件的效果，图片也正常显示。

也可以看看我之前写的[教程](https://www.toutiao.com/i6925749141444264459/)（用Jekyll创建GitHubPages完整版-用户站版）