---
layout: post
title:  "使用Jekyll创建GitHubPages站点"
date:   2021-02-05 18:30:07 +0800
categories: jekyll GitHub-Pages Typora
typora-root-url: ../
---

# 类型

GitHub Pages 站点的类型有三种：

![image-20210205183204785](/assets/2022-02-05-使用Jekyll创建GitHubPages站点.assets/image-20210205183204785.png)

# 为站点创建仓库

必须先在 GitHub 上有站点的仓库，然后才可创建站点。 

1：使用`+`下拉菜单选择 **New repository（新建仓库）**。

![image-20210205183311984](/assets/2022-02-05-使用Jekyll创建GitHubPages站点.assets/image-20210205183311984.png)



2: 输入仓库的名称和说明（可选），仓库名称必须为 `<user>.github.io` ，因为我们创建的是用户站点。

![image-20210205183627423](/assets/2022-02-05-使用Jekyll创建GitHubPages站点.assets/image-20210205183627423.png)

创建后我们的仓库就生成了：



```
https://github.com/virhuiai/virhuiai.github.io.git
```



![image-20210205184256975](/assets/2022-02-05-使用Jekyll创建GitHubPages站点.assets/image-20210205184256975.png)

# 初始化仓库

本地创建`virhuiai.github.io.git`,并提交一个文件到Github：



```
cd /Users/virhuiaivirhuiai/Documents/virhuiai-github
mkdir virhuiai.github.io.git
cd virhuiai.github.io.git
git init
echo "# virhuiai.github.io" >> README.md
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/virhuiai/virhuiai.github.io.git
```



![image-20210205184704839](/assets/2022-02-05-使用Jekyll创建GitHubPages站点.assets/image-20210205184704839.png)



再看仓库上就有我们的提交的内容了：



![image-20210205184756781](/assets/2022-02-05-使用Jekyll创建GitHubPages站点.assets/image-20210205184756781.png)



# 创建 Jekyll 站点



在仓库目录下，运行容器



```
cd /Users/virhuiaivirhuiai/Documents/virhuiai-github/virhuiai.github.io.git
# 运行容器
docker run --name virhuiai-jekyll \
  -p 4000:4000 \
  --volume="$PWD:/srv/jekyll" \
  -it jekyll/jekyll:4.0 \
  /bin/sh
```



![image-20210205185056680](/assets/2022-02-05-使用Jekyll创建GitHubPages站点.assets/image-20210205185056680.png)



`-p`命令是为了方便后面直接在容器中运行，指定了端口。



**生成**：



```
jekyll new .
```



![image-20210205185157107](/assets/2022-02-05-使用Jekyll创建GitHubPages站点.assets/image-20210205185157107.png)



**强制生成：**



```
jekyll new  . --force
```



![image-20210205185252608](/assets/2022-02-05-使用Jekyll创建GitHubPages站点.assets/image-20210205185252608.png)



因为没装tree,切到宿主机到相应的目录下查看下结构：



```
tree -C
```



![image-20210205185351058](/assets/2022-02-05-使用Jekyll创建GitHubPages站点.assets/image-20210205185351058.png)



其中`.gitignore`还自动添加了一些内容：



![image-20210205185515843](/assets/2022-02-05-使用Jekyll创建GitHubPages站点.assets/image-20210205185515843.png)



# 修改Gemfile



打开`Gemfile`，会发现这样的提示：



```
# Happy Jekylling!
gem "jekyll", "~> 4.1.0"
# This is the default theme for new Jekyll sites. You may change this to anything you like.
gem "minima", "~> 2.5"
# If you want to use GitHub Pages, remove the "gem "jekyll"" above and
# uncomment the line below. To upgrade, run `bundle update github-pages`.
# gem "github-pages", group: :jekyll_plugins
```



![image-20210205185626515](/assets/2022-02-05-使用Jekyll创建GitHubPages站点.assets/image-20210205185626515.png)



按提示修改，其中版本号参见：



```
https://pages.github.com/versions/
```



![image-20210205190115631](/assets/2022-02-05-使用Jekyll创建GitHubPages站点.assets/image-20210205190115631.png)



```
#gem "jekyll", "~> 4.1.0"
# This is the default theme for new Jekyll sites. You may change this to anything you like.
gem "minima", "~> 2.5"
# If you want to use GitHub Pages, remove the "gem "jekyll"" above and
# uncomment the line below. To upgrade, run `bundle update github-pages`.
gem "github-pages", "~> 211", group: :jekyll_plugins
```



![image-20210205190221373](/assets/2022-02-05-使用Jekyll创建GitHubPages站点.assets/image-20210205190221373.png)



# 更新Ruby国内源

```
# 改用Ruby国内源
# 移除官方镜像源.
gem sources --remove https://rubygems.org/
# 添加国内源ruby-china。
gem sources -a https://gems.ruby-china.com/
# 确保只有一个镜像源。
gem sources -l
```



![image-20210205191906765](/assets/2022-02-05-使用Jekyll创建GitHubPages站点.assets/image-20210205191906765.png)



Gemfile中也修改：



![image-20210205192104161](/assets/2022-02-05-使用Jekyll创建GitHubPages站点.assets/image-20210205192104161.png)



# 更新



```
bundle install
```



![image-20210205190715846](/assets/2022-02-05-使用Jekyll创建GitHubPages站点.assets/image-20210205190715846.png)



下载一堆....



![image-20210205192229747](/assets/2022-02-05-使用Jekyll创建GitHubPages站点.assets/image-20210205192229747.png)



```
bundle update github-pages
```



![image-20210205192252272](/assets/2022-02-05-使用Jekyll创建GitHubPages站点.assets/image-20210205192252272.png)



嗯，已经是最新的，刚刚没注意看说明有字眼：`update and install`。

# 推送

```
git push -u origin BRANCH
```

![image-20210205192535165](/assets/2022-02-05-使用Jekyll创建GitHubPages站点.assets/image-20210205192535165.png)

已经到上面了，现在点右下角的github-pages:

# 查看GitHubPages效果

![image-20210205192808717](/assets/2022-02-05-使用Jekyll创建GitHubPages站点.assets/image-20210205192808717.png)

再点View deployment:

![image-20210205192826102](/assets/2022-02-05-使用Jekyll创建GitHubPages站点.assets/image-20210205192826102.png)

就可以看到：

![image-20210205192855410](/assets/2022-02-05-使用Jekyll创建GitHubPages站点.assets/image-20210205192855410.png)

我们的GitHub Page就配置好了。下回看的时候直接输入地址过来就可以：



```
https://virhuiai.github.io/
```



![](/assets/2022-02-05-使用Jekyll创建GitHubPages站点.assets/image-20210205193018582.png)



# 本地效果查看



```
jekyll serve
```



![image-20210205193215697](/assets/2022-02-05-使用Jekyll创建GitHubPages站点.assets/image-20210205193215697.png)



打开`http://127.0.0.1:4000/`，就和GitHub Pages上一样了。



![image-20210205193253425](/assets/2022-02-05-使用Jekyll创建GitHubPages站点.assets/image-20210205193253425.png)

