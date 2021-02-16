---
layout: post
title:  "Java中Lambda表达式简化代码的例子"
date:   2021-02-16 14:25:16 +0800
categories: Java Lambda 例子
rname-cmd: mv ./_posts/aaa.md ./_posts/2021-02-16-Java中Lambda表达式简化代码的例子.md
typora-root-url: ../
---

Lambda表达式是Java SE 8中最重要的新特性。

长期以来，Lambda表达式一直被认为是Java中缺少的特性。

# Lambda表达式语法

```java
(参数列表) -> 语句
```

或者

```java
(参数列表) -> {
    语句组
}
```

# Lambda表达式简化代码的例子

Lambda表达式也称为闭包（closures），它可以使某些Java代码结构更简短，更易于阅读，尤其是在使用内部类时。

```
closure
美 ['kloʊʒər]
英 ['kləʊʒə(r)]
n.关闭；倒闭；（路或桥的）暂时封闭
v.使结束
网络闭包；闭合；封闭性
```

考虑下面的代码片段，它使用**java.lang.Runnable**接口定义一个匿名内部类同时实例化该类：

```java
Runnable runnable = new Runnable() {
    @Override
    public void run() {
        System.out.println("Running...");
    }
}
```

使用Lambda表达式可将上述代码替换为如下形式：

```java
Runnable runnable = () -> System.out.println("Running...");
```

换句话说，如果需要将**Runnable**传递给**java.util.concurrent.Executor**，可以写成下面这样：

```java
executor.execute(new Runnable() {
    @Override 
    public void run() {
        System.out.println("Running...");
    }
});
```

使用如下的Lambda表达式有相同的效果：

```java
executor.execute(() -> System.out.println("Running..."));
```

这样的代码简短、亲切，同时更清晰，也更具表现力。