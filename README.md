### It's how my Vim looks now:

![screenshots](https://raw.github.com/ButBueatiful/dotvim/master/screenshots/vim-screenshot.jpg)

### Install:

    sudo apt-get install -y build-essential cmake python-dev

#### python

    pip install flake8 # check
    pip install jedi   # autocomplete

#### golang

    go get https://github.com/golang/tools
    mkdir -p $GOTOOLS/golang.org/x/
    mv $GOTOOLS/src/github.com/golang/tools $GOTOOLS/src/golang.org/x/
    go get github.com/bradfitz/goimports  # 自动添加/移除import
    go get github.com/nsf/gocode          # 自动跳转
    go get github.com/jstemmer/gotags     # 自动补全
    go get github.com/rogpeppe/godef      # Tagbar显示函数列表

#### Install

	cd ~
	git clone https://github.com/ButBueatiful/dotvim.git .vim
	cd ~/.vim/
    ./setup.sh

#### Build YouCompleteMe

    cd ~/.vim/bundle/YouCompleteMe
    ./install.py --clang-completer --gocode-completer
