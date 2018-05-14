# x-vim: Tony Xu's Vim Configuration

                    _
	__  __   __   _(_)_ __ ___
	\ \/ /___\ \ / / | '_ ` _ \
	 >  <_____\ V /| | | | | | |
	/_/\_\     \_/ |_|_| |_| |_|

<!-- vim-markdown-toc GFM -->

* [Installation](#installation)
    * [CentOS](#centos)
    * [Ubuntu](#ubuntu)
    * [Programing Language](#programing-language)
        * [C/C++](#cc)
        * [Python](#python)
        * [Go](#go)
    * [vim](#vim)
    * [YouCompleteMe](#youcompleteme)
* [Settings](#settings)
* [More](#more)

<!-- vim-markdown-toc -->

![x-vim-screenshots](http://7xnvif.com1.z0.glb.clouddn.com/x-vim-screenshot.png)

## Installation

### CentOS

```sh
sudo yum groupinstall 'Development Tools'
sudo yum install epel-release
sudo yum install -y automake cmake gcc gcc-c++ llvm clang clang-devel python-devel python-pip ctags the_silver_searcher
```

### Ubuntu

```sh
sudo apt install -y build-essential cmake llvm-3.8 clang-3.8 python-dev python-pip ctags silversearcher-ag
```

### Programing Language

#### C/C++

```sh
sudo dnf intall -y cppcheck
```

#### Python

```sh
sudo pip install flake8 pep8 pylint jedi vim-vint
sudo apt-get install -y shellcheck  # Ubuntu
sudo dnf install -y ShellCheck      # Fedora
```

#### Go

```sh
go get -u -v https://github.com/golang/tools
mkdir -p $GOTOOLS/golang.org/x/
mv $GOTOOLS/src/github.com/golang/tools $GOTOOLS/src/golang.org/x/
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
./install.py --system-libclang --clang-completer
# ./install.py --system-libclang --clang-completer --go-completer
# ./install.py --system-libclang --all
```

* --clang-completer for `c/c++`
* --gocode-completer for `golang`
* ./install.py -h

## Settings

默认启用所有插件你可以创建`~/.vimrc.before`文件通过设置变量`x_plugin_groups`来启用你需要的插件, 例如：

```vim
let g:x_plugin_groups=['general', 'programming', 'go', 'python', 'ruby' 'html']
```

## More
[x-vim wiki](https://github.com/hhktony/x-vim/wiki)
