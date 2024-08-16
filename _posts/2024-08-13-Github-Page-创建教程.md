---
categories: tutorial
---
## 前言

不使用电脑，仅使用平板来建立一个博客。有一说一，这好像不是很难。但是新建博客了，总得写点什么吧。不然空荡荡的，只有 `jekyll` 官方的一篇示例。于是便记录了过程中的一些截图，然后写了这篇博文。

本教程基于华为 `matepad 12.6 2022`，使用 `Edge` 浏览器。使用 `Github` 平台的 `Github Page `服务，基于 `jekyll` 模板，使用默认 `jekyll` 主题 `minima`。

## 创建仓库

### 1. 点击创建仓库按钮

![点击创建仓库按钮]({{'../assets/Images/2024-08-13-Github-Page-Create-Tutorial/create%20repo%20button.jpg'| relative_url }})

### 2. 仓库设定

![创建仓库]({{'../assets/Images/2024-08-13-Github-Page-Create-Tutorial/create_repo.jpg' | relative_url }})

## 创建Codespace

### 1. 点击新建codespace按钮
![点击创建codespace按钮]({{'../assets/Images/2024-08-13-Github-Page-Create-Tutorial/newCodespaceButton.jpg' | relative_url }})

### 2. codespace设定
直接默认设定就行了。
![创建codespace]({{'../assets/Images/2024-08-13-Github-Page-Create-Tutorial/createCodeSpace.jpg' | relative_url }})

## jekyll生成博客

### 1. 命令行操作

首先打开终端，如下图所示（也可以使用 ``Ctrl + Shift + ` ``打开终端，`` ` ``是反引号，在键盘左上角）。

![jekyll创建博客]({{'../assets/Images/2024-08-13-Github-Page-Create-Tutorial/openTerminal.jpg' | relative_url }})

运行下图中 3 个命令，你也可以只运行步骤3。

![jekyll创建博客]({{'../assets/Images/2024-08-13-Github-Page-Create-Tutorial/createBlog.jpg' | relative_url }})

你可能不懂命令行——只需要输入图中框起来的内容，然后回车就行。如果想在命令行中翻页的话，可以使用` Shift + PageUp / PageDown`。 




### 2. 修改设置
根据你的需求自行修改参数。
![个人信息修改]({{'../assets/Images/2024-08-13-Github-Page-Create-Tutorial/cofigProfile.jpg' | relative_url }})

## git提交修改并同步

### 1. `git commit`

如果你没听过 `git`，照着图片做好了。 

![git暂存变更]({{'../assets/Images/2024-08-13-Github-Page-Create-Tutorial/stageChanges.jpg' | relative_url }})

### 2. `git` 推送到 `Github`

![同步变更到Github]({{'../assets/Images/2024-08-13-Github-Page-Create-Tutorial/syncChanges.jpg' | relative_url }})

## 访问博客

大功告成，等40s左右（我是这个时间）。`Github`需要一定时间来生成网站，等生成好后，你就可以输入网址：`https://github用户名.github.io` （例如我的是：[`https://znbic.github.io`](https://znbic.github.io)）访问了。

![访问博客]({{'../assets/Images/2024-08-13-Github-Page-Create-Tutorial/visitBlog.jpg' | relative_url }})

## 后记

这篇博客也是仅用华为平板编辑的，华为的图片编辑还是不行，只是凑合用的程度，所以请读者体谅一下。

因为习惯了英文的`vs code`，然后找不到语言切换，只能把平板的语言换成英语来更改`vs code`语言，接着发现华为平板的手写笔输入不了中文了。所以平板还是不如电脑操作起来方便啊～
