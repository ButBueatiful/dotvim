# x-vim: Tony Xu's Vim Configuration

                    _
	__  __   __   _(_)_ __ ___
	\ \/ /___\ \ / / | '_ ` _ \
	 >  <_____\ V /| | | | | | |
	/_/\_\     \_/ |_|_| |_| |_|

<!-- vim-markdown-toc GFM -->

* [Requirements](#requirements)
* [Installation](#installation)
    * [CentOS](#centos)
    * [Ubuntu](#ubuntu)
    * [Programing Language](#programing-language)
        * [C/C++](#cc)
        * [Python](#python)
        * [bash](#bash)
        * [Go](#go)
    * [vim](#vim)
    * [YouCompleteMe](#youcompleteme)
* [More](#more)

<!-- vim-markdown-toc -->

![x-vim-screenshots](http://7xnvif.com1.z0.glb.clouddn.com/x-vim-screenshot.png)

## Requirements

- [fzf (A command-line fuzzy finder)](https://github.com/junegunn/fzf)
- [ag (The Silver Searcher)](https://github.com/ggreer/the_silver_searcher)
- [rg (Ripgrep)](https://github.com/BurntSushi/ripgrep)
- [Universal ctags](https://ctags.io)

## Installation

### CentOS

```sh
sudo yum groupinstall 'Development Tools'
sudo yum install epel-release
sudo yum install -y git fzf ctags the_silver_searcher
```

### Ubuntu

```sh
sudo apt install -y git fzf ctags silversearcher-ag
```

### Programing Language

#### C/C++

```sh
sudo dnf intall -y cppcheck
```

#### Python

```sh
sudo yum install -y python-pip
sudo apt install -y python-pip
sudo pip install --upgrade pip
sudo pip install flake8 pep8 pylint jedi vim-vint
```

#### bash

```sh
sudo apt-get install -y shellcheck  # Ubuntu
sudo dnf install -y ShellCheck      # Fedora
```

#### Go

```sh
gopm bin -d $GOPATH/bin golang.org/x/tools/cmd/goimports
gopm bin -d $GOPATH/bin golang.org/x/tools/cmd/gorename
gopm bin -d $GOPATH/bin golang.org/x/tools/cmd/guru
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
./install.py --clangd-completer
# ./install.py --system-libclang --clang-completer --go-completer
# ./install.py --system-libclang --all
```

* --clang-completer or --clangd-completer for `c/c++`
* --gocode-completer for `golang`
* ./install.py -h

## More
[x-vim wiki](https://github.com/hhktony/x-vim/wiki)
