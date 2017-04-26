" Vim File
"  Filename: vimrc
"   Created: 2013-07-23 01:13:02
"      Desc:
"          _
"   __   _(_)_ __ ___  _ __ ___
"   \ \ / / | '_ ` _ \| '__/ __|
"    \ V /| | | | | | | | | (__
"     \_/ |_|_| |_| |_|_|  \___|
"
"    Author: xutao(Tony Xu), hhktony@gmail.com
"   Company: myself

set nocompatible               " be iMproved
" let g:enable_plugin = 1

if filereadable(expand("~/.vimrc.before"))
    source ~/.vimrc.before
endif

" if g:enable_plugin
if filereadable(expand("~/.vim/vimrc.plugins"))
    source ~/.vim/vimrc.plugins
endif

" General {
let g:mapleader = ","
set history=1000

filetype plugin indent on
syntax on

set number                      " 显示行号
set shortmess=atI               " I不显启动时的信息
set showmode                    " 在插入、替换和可视模式里，在最后一行提供消息
set showcmd                     " 在屏幕最后一行显示当前命令
set showmatch                   " 显示括号配对情况
set matchtime=1                 " 跳转到匹配括号的时间
set scrolloff=3                 " 上下滚动保留屏幕3行
" set t_ti= t_te=                 " 退出vim后，内容显示在终端屏幕
" set cmdheight=1                 " 命令行的高度，默认为1
set vb t_vb=                    " 关闭响铃和闪烁
set novb
set noeb

set magic                       " 增强行正则

set ignorecase                  " 搜索时忽略大小写
set smartcase                   " 搜索模式只包含小写字母时才忽略大小写
set gdefault                    " 默认开启全局匹配(在替换时不用输入g)
set incsearch                   " 开启实时搜索功能
set hlsearch                    " 开启高亮显示结果
" set wrapscan                    " 搜索到文件两端时重新搜索

set wildmenu                    " 命令补全
set wildmode=longest:list:full  " 命令模式Tab补全顺序

set backspace=indent,eol,start  " 退格键和方向键可以换行
set whichwrap=b,s,h,l,<,>,[,]   " 允许backspace和光标键跨越行边界

set shiftwidth=4                " 使用4个空格缩进
set tabstop=4                   " 编辑时一个Tab字符占4个空格的位置
set softtabstop=4               " 每次退格将删除4个空格
set expandtab                   " 将输入的Tab自动展开成空格
set smarttab                    " 在行首按Tab将加入sw个空格，否则加入ts个空格
set autoindent                  " 继承前一行的缩进方式
set smartindent                 " 为c/c++程序提供自动缩进
set cindent                     " c/c++样式缩进
set cinoptions=:0,l1,t0,g0      " Linux kernel style
set cpoptions+=$                " cw显示$
set nowrap                      " 取消自动换行
set textwidth=78
set formatoptions+=mM

" set modeline                    " 开启模式行支持
set autoread                    " 当文件在外部被修改时，自动重新读取
set hidden                      " 允许在有未保存的修改时切换缓冲区
set ttyfast

" set path+=../include            " gf搜索路径
" set autochdir                   " 当前目录为工作目录

" set iskeyword+=$,@,%,#,-        " 包含这些字符时当作一个单词
set dictionary+=~/.vim/dict/simple  " For i_CTRL_X_K

" set list                        " 显示Tab符
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
set fillchars=vert:\ ,stl:\ ,stlnc:\    " 在被分割的窗口间显示空白
set completeopt=menu,menuone,longest
" }

" Record exit position {
au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ execute 'normal! g`"zvzz' |
    \ endif
" }

" Backups {
set nobackup
set noswapfile

if has('persistent_undo')
    set undodir=~/.vimundo
    if !isdirectory(&undodir)
        call mkdir(&undodir, 'p')
    endif
    set undofile
    set undolevels=1000
    set undoreload=10000
endif
" }

" AutoGroups codeing style {
autocmd Filetype sh,zsh,css,html,ruby,php,javascript,json,yaml setlocal ts=2 sts=2 sw=2 ex
" }

" Encode {
set encoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set termencoding=utf-8
" }

" UI {
if &term == 'xterm' || &term == 'screen'
    set t_Co=256    " 颜色数目为256
endif

set background=dark
if &diff
    if filereadable(expand("~/.vim/colors/github.vim"))
        colorscheme github
    endif
else
    if filereadable(expand("~/.vim/colors/molokai.vim"))
        colorscheme molokai
    else
        colorscheme desert
        hi ColorColumn ctermbg=236
    endif
endif

if exists('+colorcolumn')
    set colorcolumn=80
    " set cursorline                  " 突出显示当前行
endif

if has('statusline')
    set laststatus=2
    " Broken down into easily includeable segments
    set statusline=\ %f\                        " Filename
    set statusline+=%(%{&fenc}\[%{&ff}]%)       " Fencoding
    set statusline+=%y                          " Filetype
    set statusline+=%#errormsg#
    set statusline+=%r "read only flag
    set statusline+=%*
    set statusline+=%m "modified flag

    set statusline+=%#warningmsg#
    set statusline+=%*
    set statusline+=%=%-10.(%l,%c%V\ \:\ %p%%%)\ " Right aligned file nav info
endif
" }

" Key (re)Mappings {
cmap w!! %!sudo tee > /dev/null %

nmap <silent> <Tab> :bn<CR>
nmap <silent> <S-Tab> :bp<CR>

vnoremap > >gv
vnoremap < <gv

nmap <silent> <Leader>fef ggVG=``
nnoremap <Leader>q gqip

"Keep search pattern at the center of the screen.
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz

" 增强正则
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

nnoremap <silent> <Leader><CR> :noh<CR>

set pastetoggle=<Leader>pp
" nmap <silent> <Leader>ss :setlocal spell!<CR>

nnoremap <Leader>W :%s/\s\+$//<CR>:let @/=''<CR>

nmap <C-\> :!dict <C-R>=expand("<cword>")<CR><CR>

" nmap <Leader>rb :%!xxd<CR>
" nmap <Leader>nrb :%!xxd -r<CR>

inoremap <C-A> <Esc>I
inoremap <C-E> <Esc>A

nnoremap j gj
nnoremap k gk

nnoremap <F1> <ESC>
inoremap <F1> <ESC>
vnoremap <F1> <ESC>

" 末行模式仿emacs快捷键
cnoremap <C-A>      <Home>
cnoremap <C-B>      <Left>
cnoremap <C-E>      <End>
cnoremap <C-F>      <Right>
cnoremap <C-N>      <Down>
cnoremap <C-P>      <Up>
cnoremap <ESC>b     <S-Left>
cnoremap <ESC><C-B> <S-Left>
cnoremap <ESC>f     <S-Right>
cnoremap <ESC><C-F> <S-Right>
cnoremap <ESC><C-H> <C-W>
" }

" Folding {
" au BufWinLeave * silent! mkview   " 让vim保存当前的折叠
" au BufWinEnter * silent! loadview " 打开上次保存的折叠样式
set foldlevelstart=0
nnoremap ,z zMzvzz
" Make zO recursively open whatever top level fold we're in, no matter where
" the cursor happens to be.
nnoremap zO zCzO
" }

" matchit.vim {
    runtime macros/matchit.vim
" }

" man.vim {
if filereadable($VIMRUNTIME . "/ftplugin/man.vim")
    source $VIMRUNTIME/ftplugin/man.vim
    nnoremap <silent> <S-k> :Man <c-r>=expand("<cword>")<CR><CR>
endif
" }

" QuickFix Window {
nnoremap <silent> <Leader>qx :ccl<CR>
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
" }

" if g:enable_plugin
if filereadable(expand("~/.vim/vimrc.plugins.settings"))
    source ~/.vim/vimrc.plugins.settings
else
    iabbrev ipdb import ipdb; ipdb.set_trace()
endif

" vim: set et sw=4 ts=4 sts=4 tw=78 fmr={,} fdl=0 fdm=marker:
