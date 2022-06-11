# Go 语言开发环境

最近在写投资量化程序，技术选型选择了 Golang 语言。但是在国内网上查关于 Go 语言的开发环境搭建，内容比较零碎，尤其在代码项目规范方面比较缺失。根据网上查到的资料，Golang 在 1.11 版本之后启用了 `module` 功能，而原有的 `GOPATH` 依赖方式将在 1.16 版本后被放弃。于是在这里记录一下目前（2022.06.11）如何比较规范地初始化一个 Golang project。

## go 语言安装

我用的是 Arch Linux，所以可以直接安装 go 软件包。

```bash
yay -S go
```

需要配置 `GOPATH` 环境变量。

进入你的项目文件夹。我习惯用 Git 来管理项目，所以可以新建一个 Git 仓库。

```bash
cd project/

git init

git remote ......
```

如何连接远程仓库不再赘述。接下来需要使用 `module` 功能新建一个 `go.mod` 文件

```bash
go mod init <project_name>
```

使用你的项目名称代替 `<project_name>`。

关于 `module` 功能及依赖管理有几篇文章可以帮助你熟悉。

首先是 Golang 官方 Wiki 中指明的博客文章 [Using Go Modules](https://go.dev/blog/using-go-modules) 

我注意到，Golang 教程里也有使用 `module` 的叙述。这两篇都是比较权威的文档：

1. [Tutorial: Get started with Go](https://go.dev/doc/tutorial/getting-started)
2. [Tutorial: Getting started with multi-module workspaces](https://go.dev/doc/tutorial/workspaces)

中文资料，《Go 语言圣经》由于成书时间较早，我注意到其中并没有关于 `module` 的详细介绍。但是另一本教程《Go2 编程语言》对于 Go 语言改进的新功能有所介绍。它关于模块化专门有一章论述：[第 2 章 模块化](https://chai2010.cn/go2-book/ch2/readme.html)

但是这本书目前还没有写完。可以在知乎上搜索“go module”，有一些比较优质的文章参考。

## 编辑器及插件

编辑器使用 VScode。除了安装 GO 插件外。本地可以安装三个要使用的工具：

```bash
yay -S gopls delve staticcheck
```

如果插件找不到这三个工具的话会提示安装。但是使用包管理器会更好一些。
