## x-vim: Tony Xu's Vim Configuration

                    _
    __  __   __   _(_)_ __ ___
    \ \/ /___\ \ / / | '_ ` _ \
     >  <_____\ V /| | | | | | |
    /_/\_\     \_/ |_|_| |_| |_|

<!-- vim-markdown-toc GFM -->

* [Requirements](#requirements)
* [Installation](#installation)
    * [Dependency](#dependency)
    * [安装 node](#安装-node)
    * [安装 x-vim](#安装-x-vim)
    * [Programing Language [Option]](#programing-language-option)
        * [Python](#python)
        * [C/C++](#cc)
        * [Go](#go)
        * [bash](#bash)
* [Key-mappings](#key-mappings)
* [coc.nvim](#cocnvim)
* [Other](#other)
* [More](#more)

<!-- vim-markdown-toc -->

## Requirements

- [fzf (A command-line fuzzy finder)](https://github.com/junegunn/fzf)
- [bat A cat(1) clone with wings.](https://github.com/sharkdp/bat) - [opt]
- [ag (The Silver Searcher)](https://github.com/ggreer/the_silver_searcher)
- [rg (Ripgrep)](https://github.com/BurntSushi/ripgrep)
- [Universal ctags](https://ctags.io)

## Installation

### Dependency

```bash
# CentOS
sudo yum groupinstall 'Development Tools'
sudo yum install epel-release
sudo yum install -y git fzf ctags cscope the_silver_searcher

# Ubuntu
sudo apt install -y git fzf ctags silversearcher-ag

# MacOS
brew install git fzf ag bat cscope ctags
```

### 安装 node

```bash
git clone https://github.com/nvm-sh/nvm.git ~/.nvm
cd ~/.nvm && git checkout v0.39.7

# 添加环境变量到 ~/.bashrc
if [ -d "$HOME/.nvm" ];then
  export NVM_NODEJS_ORG_MIRROR="http://npm.taobao.org/mirrors/node"
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
fi

source ~/.bashrc

nvm install v18.19.0
nvm alias default v18.19.0
npm config set registry https://registry.npm.taobao.org
```

### 安装 x-vim

```bash
git clone https://github.com/hhktony/x-vim.git ~/.vim
cd ~/.vim/ && ./install.sh
```

### Programing Language [Option]

#### Python

```sh
pip install pytest ruff pynvim
```

#### C/C++

- [ccls buld](https://github.com/MaskRay/ccls/wiki/Build)

```sh
# MacOS
brew install ccls
```

#### Go

```bash
go install golang.org/x/tools/gopls@latest
```

#### bash

```sh
npm i -g bash-language-server
```

## Key-mappings

| Key                        | Mode   | Action
| -----                      | :----: | --------
| <kbd>,</kbd>+<kbd>gd</kbd> | 𝐍      | coc-definition

## coc.nvim

Command

```vim
:CocInstall coc-omni
:CocInstall coc-omni@1.0.0
:CocUninstall coc-omni
:CocList extensions  " 查看当前buffer已加载的插件
:CocList marketplace " 浏览插件市场
:CocList maps        " 查看所有的 keymap
```

Debug

```bash
export NVIM_COC_LOG_LEVEL=debug && export NVIM_COC_LOG_FILE=/tmp/coc.log
```

## Other

```vim
echo keys(g:plugs)  " 查看当前 buffer 已加载的插件
```

## More

- [x-vim wiki](https://github.com/hhktony/x-vim/wiki)
