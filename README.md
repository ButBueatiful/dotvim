x-vim: Tony Xu's Vim Configuration
==================================

                    _
	__  __   __   _(_)_ __ ___
	\ \/ /___\ \ / / | '_ ` _ \
	 >  <_____\ V /| | | | | | |
	/_/\_\     \_/ |_|_| |_| |_|

- [Installation](#installation)
    - [Dependencies](#dependencies)
        - [CentOS](#centos)
        - [Ubuntu](#ubuntu)
    - [Programing Language](#programing-language)
        - [Python](#python)
        - [Go](#go)
    - [vim](#vim)
    - [YouCompleteMe](#youcompleteme)
- [Settings](#settings)
- [More](#more)

![screenshots](https://raw.github.com/hhktony/x-vim/master/screenshots/vim-screenshot.jpg)


Installation
------------

## Dependencies

### OS

#### CentOS

```sh
sudo yum groupinstall 'Development Tools'
sudo yum install epel-release
sudo yum install -y cmake llvm clang clang-devel gcc-c++ \
                    python-devel python-pip \
                    ctags the_silver_searcher
```

#### Ubuntu

```sh
sudo apt install -y build-essential cmake llvm-3.8 clang-3.8 \
                    python-dev python-pip \
                    ctags silversearcher-ag
```

### Programing Language

#### Python

```sh
sudo pip install flake8 pep8 pylint jedi
```

#### Go

```sh
go get https://github.com/golang/tools
mkdir -p $GOTOOLS/golang.org/x/
mv $GOTOOLS/src/github.com/golang/tools $GOTOOLS/src/golang.org/x/
go get github.com/bradfitz/goimports  # 自动添加/移除import
go get github.com/nsf/gocode          # 自动跳转
go get github.com/jstemmer/gotags     # 自动补全
go get github.com/rogpeppe/godef      # Tagbar显示函数列表
```

### vim

```sh
git clone https://github.com/hhktony/x-vim.git ~/.vim
cd ~/.vim/ && ./install.sh
```

### YouCompleteMe

```sh
git clone --depth 1 https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
./install.py --system-libclang --clang-completer --gocode-completer
./install.py --system-libclang --all
```

* --clang-completer for `c/c++`
* --gocode-completer for `golang`
* ./install.py -h

Settings
--------

默认启用所有插件你可以创建`~/.vimrc.before`文件通过设置变量`x_plugin_groups`来
启用你需要的插件, 例如：

```vim
let g:x_plugin_groups=['general', 'programming', 'go', 'python', 'ruby' 'html']
```

More
----
[x-vim wiki](https://github.com/hhktony/x-vim/wiki)
