# Go 语言开发环境

最近在写投资量化程序，技术选型选择了 Golang 语言。但是在国内网上查关于 Go 语言的开发环境搭建，内容比较零碎，尤其在代码项目规范方面比较缺失。根据网上查到的资料，Golang 在 1.11 版本之后启用了 `module` 功能，而原有的 `GOPATH` 依赖方式将在 1.16 版本后被放弃。于是在这里记录一下目前（2022.06.11）如何比较规范地初始化一个 Golang project。

## Go 语言安装

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

如果插件找不到这三个工具的话会提示安装，但是使用包管理器会更好一些。当然你也可以在插件配置中写入这三个工具可执行文件的目录，取决于你的习惯。

Go 语言特性比较简单，所以比较容易配置。

## 代码组织规范

这一部分比较折磨人。首先在 Github 上有一个比较受欢迎的项目 [golang-standards/project-layout](https://github.com/golang-standards/project-layout)。这一项目目前有 32.5k 的 star，而且这一规范被普遍使用。

~~唯一的槽点在于拥有这项目的组织“golang-standards”好像和 google/golang 没有任何关系，而且 golang 官方仓库使用了这一标准专门说明不准使用的 src 目录~~

至于规范的详细讲解，知乎、简书包括这篇规范的中文翻译都讲很清楚了。我在这里专门讲一件事：使用 `module` 组织项目依赖后，如何在 `cmd/` 的代码文件中 import `internal` 中的 package。

这是我们的项目文件结构：

```bash
❯ tree .
.
├── cmd
│   └── app
│       └── main.go
├── go.mod
├── internal
│   └── reverse.go
├── LICENSE
└── README.md

```

这是 `main.go` 中的代码：

```go
package main

import (
    "fmt"

    "fultocapital/internal"
)

func main() {
    fmt.Println("Hello, World!")
    fmt.Println(morestrings.ReverseRunes("!oG ,olleH"))
}

```

这是 `reverse.go` 中的代码：

```go
// Package morestrings implements additional functions to manipulate UTF-8
// encoded strings, beyond what is provided in the standard "strings" package.
package morestrings

// ReverseRunes returns its argument string reversed rune-wise left to right.
func ReverseRunes(s string) string {
    r := []rune(s)
    for i, j := 0, len(r)-1; i < len(r)/2; i, j = i+1, j-1 {
        r[i], r[j] = r[j], r[i]
    }
    return string(r)
}

```

要注意的是，`main.go` 中 import 到 internal 文件夹就好了。其实写对了以后挺好想清楚的，但是这样简单的示例任何教程里都没有明确讲清楚，国内各种博客甚至还停留在 src 的时代（点名 CSDN）。对于初学者来说，卡在这一步比较痛苦。编程最难受的不是遇到很难的问题，而是被很基础的问题卡很久。

## 最后

接下来就可以编程了。
