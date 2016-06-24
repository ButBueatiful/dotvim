x-vim
=====

![screenshots](https://raw.github.com/hhktony/dotvim/master/screenshots/vim-screenshot.jpg)

- [Installation](#installation)
    - [CentOS](#centos)
    - [Ubuntu](#ubuntu)
    - [Python](#python)
    - [Golang](#golang)
    - [x-vim](#x-vim)
- [Settings](#settings)

Installation
------------

### CentOS

    sudo yum install -y python-devel python-pip

### Ubuntu

    sudo apt-get install -y build-essential cmake python-dev python-pip

### Python

    sudo pip install flake8 # check
    sudo pip install jedi   # autocomplete
    sudo pip install pylint

### Golang

    go get https://github.com/golang/tools
    mkdir -p $GOTOOLS/golang.org/x/
    mv $GOTOOLS/src/github.com/golang/tools $GOTOOLS/src/golang.org/x/
    go get github.com/bradfitz/goimports  # 自动添加/移除import
    go get github.com/nsf/gocode          # 自动跳转
    go get github.com/jstemmer/gotags     # 自动补全
    go get github.com/rogpeppe/godef      # Tagbar显示函数列表

### x-vim

	cd
	git clone https://github.com/hhktony/x-vim.git .vim
	cd ~/.vim/
    ./setup.sh

### YouCompleteMe

    cd ~/.vim/bundle/YouCompleteMe
    ./install.py --clang-completer --gocode-completer

Settings
--------

默认启用所有插件你可以创建`~/.vimrc.before`文件通过设置变量`x_plugin_groups`来
启用你需要的插件, 例如：

    let g:x_plugin_groups=['general', 'programming', 'python', 'html']
