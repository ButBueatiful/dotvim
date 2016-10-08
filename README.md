x-vim: Tony Xu's Vim Configuration
==================================

	__  __   __   _(_)_ __ ___
	\ \/ /___\ \ / / | '_ ` _ \
	 >  <_____\ V /| | | | | | |
	/_/\_\     \_/ |_|_| |_| |_|

- [Installation](#installation)
    - [CentOS](#centos)
    - [Ubuntu](#ubuntu)
    - [Python](#python)
    - [Golang](#golang)
    - [vim](#vim)
- [Settings](#settings)

![screenshots](https://raw.github.com/hhktony/x-vim/master/screenshots/vim-screenshot.jpg)


Installation
------------

### CentOS

    sudo yum groupinstall 'Development Tools'
    sudo yum install epel-release
    sudo yum install -y cmake llvm clang clang-devel gcc-c++ python-devel python-pip ctags the_silver_searcher

### Ubuntu

    sudo apt-get install -y build-essential cmake llvm-3.8 clang-3.8 python-dev python-pip ctags silversearcher-ag

### Python

    sudo pip install flake8 pep8 pylint jedi

### Golang

    go get https://github.com/golang/tools
    mkdir -p $GOTOOLS/golang.org/x/
    mv $GOTOOLS/src/github.com/golang/tools $GOTOOLS/src/golang.org/x/
    go get github.com/bradfitz/goimports  # 自动添加/移除import
    go get github.com/nsf/gocode          # 自动跳转
    go get github.com/jstemmer/gotags     # 自动补全
    go get github.com/rogpeppe/godef      # Tagbar显示函数列表

### vim

	cd
	git clone https://github.com/hhktony/x-vim.git .vim
	cd ~/.vim/
    ./install.sh

### YouCompleteMe

    cd ~/.vim/plugged//YouCompleteMe
    ./install.py --clang-completer --gocode-completer

Settings
--------

默认启用所有插件你可以创建`~/.vimrc.before`文件通过设置变量`x_plugin_groups`来
启用你需要的插件, 例如：

    let g:x_plugin_groups=['general', 'programming', 'python', 'html']
