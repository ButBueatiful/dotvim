"{{{ bundle
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

"------------------
" Code Completions
"------------------
" Bundle 'Shougo/neocomplcache'
" Bundle 'Shougo/neosnippet.vim'
" Bundle 'honza/vim-snippets'
" Bundle 'mattn/zencoding-vim'
Bundle 'Raimondi/delimitMate'
" Bundle 'honza/snipmate-snippets'
Bundle 'ervandew/supertab'
Bundle 'garbas/vim-snipmate'
"------ snipmate dependencies -------
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'

"-----------------
" Fast navigation
"-----------------
Bundle 'tsaleh/vim-matchit'
" Bundle 'Lokaltog/vim-easymotion'

"--------------
" Fast editing
"--------------
Bundle 'DoxygenToolkit.vim'
Bundle 'OmniCppComplete'
Bundle 'a.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'godlygeek/tabular'
" Bundle 'tpope/vim-surround'
" Bundle 'sjl/gundo.vim'
" Bundle 'nathanaelkane/vim-indent-guides'

"--------------
" IDE features
"--------------
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'bling/vim-airline'
" Bundle 'Lokaltog/vim-powerline'
" Bundle 'scrooloose/syntastic'
" Bundle 'bronson/vim-trailing-whitespace'

"-------------
" Other Utils
"-------------
" Bundle 'humiaozuzu/fcitx-status'
" Bundle 'nvie/vim-togglemouse'

"----------------------------------------
" Syntax/Indent for language enhancement
"----------------------------------------
"------- web backend ---------
" Bundle '2072/PHP-Indenting-for-VIm'
" Bundle 'tpope/vim-rails'
" Bundle 'lepture/vim-jinja'
" Bundle 'digitaltoad/vim-jade'

"------- web frontend ----------
" Bundle 'othree/html5.vim'
" Bundle 'tpope/vim-haml'
" Bundle 'pangloss/vim-javascript'
" Bundle 'kchmck/vim-coffee-script'
" Bundle 'nono/jquery.vim'
" Bundle 'groenewege/vim-less'
" Bundle 'wavded/vim-stylus'
" Bundle 'nono/vim-handlebars'

"------- markup language -------
Bundle 'tpope/vim-markdown'
" Bundle 'timcharper/textile.vim'

"------- Ruby --------
" Bundle 'tpope/vim-endwise'

"------- Go ----------
" Bundle 'jnwhiteh/vim-golang'

"------- FPs ------
" Bundle 'kien/rainbow_parentheses.vim'
" Bundle 'wlangstroth/vim-racket'
" Bundle 'vim-scripts/VimClojure'
" Bundle 'rosstimson/scala-vim-support'

"--------------
" Color Schemes
"--------------
" Bundle 'rickharris/vim-blackboard'
" Bundle 'altercation/vim-colors-solarized'
" Bundle 'rickharris/vim-monokai'

filetype plugin indent on     " required!
" }}}

"{{{ General
set nocompatible                " 关闭兼容模式
set history=500                 " 命令显示历史

let g:mapleader = ","           " 全局设置用,代替\

set background=dark             " 设置一个黑暗的背景
colorscheme molokai

set scrolloff=3                 " 上下滚动隔3行

set modeline                    " 开启模式行支持
set linespace=0                 " 行与行之间没有多余的空格
set backspace=indent,eol,start  " 退格键和方向键可以换行
set whichwrap=b,s,h,l,<,>,[,]   " 允许backspace和光标键跨越行边界

set nu                          " 显示行号
set showmode                    " 显示当前模式

set ignorecase                  " 搜索时忽略大小写
set smartcase                   " 如果搜索模式包含大写字符，
                                " 不使用 'ignorecase' 选项
"set gdefault
set hlsearch                    " 开启高亮显示结果
set wrapscan                    " 搜索到文件两端时重新搜索
set incsearch                   " 开启实时搜索功能
map <silent> <leader><cr> :noh<cr>

set showmatch                   " 显示括号配对情况
set matchtime=1                 " 跳转到匹配括号的时间

set magic                       " 增强行正则

set cpoptions+=$                " cw显示$
set nowrap                      " 自动换行
set textwidth=78
set formatoptions+=mM
" set colorcolumn=78              " 在第 78 列显示一条竖线
" set cursorline                  " 突出显示当前行

set cmdheight=1                 " 命令行的高度，默认为1
set ruler                       " 右下角显示光标位置的状态行
set showcmd                     " 显示未完成的命令

set vb t_vb=                    " 关闭提示音
set novisualbell                " 不要闪烁
set noerrorbells                " 不让vim发出讨厌的滴滴声
set hidden                      " 允许在有未保存的修改时切换缓冲区

set tabstop=4                   " 编辑时一个TAB字符占4个空格的位置
set shiftwidth=4                " 使用4个空格缩进"
set softtabstop=4               " 每次退格将删除4个空格
set expandtab                   " 将输入的TAB自动展开成空格
set smarttab                    " 在行首按TAB将加入sw个空格，否则加入ts个空格

set autoindent                  " 继承前一行的缩进方式
set cindent                     " c/c++样式缩进
set smartindent                 " 为c/c++程序提供自动缩进

syntax enable                   " 打开语法高亮
syntax on                       " 开启文件类型侦测

set nobackup                    " 设置无备份文件
set nowritebackup
setlocal noswapfile             " 不生成swap文件
set autoread                    " 当文件在外部被修改时，自动重新读取

set wildmenu                    " 命令补全
set wildmode=longest,list,full  " tab键显示文件列表

set path+=../include            " gf搜索路径
"set autochdir                  " 当前目录为工作目录

set dictionary+=~/.vim/dict/simple  " For i_CTRL_X_K
" set iskeyword+=_,$,@,%,#,-      " 包含这些字符时当作一个单词

" set foldenable                  " 开始折叠
" set foldmethod=syntax           " 设置语法折叠
" set foldcolumn=0                " 设置折叠区域的宽度
" setlocal foldlevel=1            " 设置折叠层数为
" set foldclose=all               " 设置为自动关闭折叠
" set fo=croq                     " c格式化代码
" au BufWinLeave * silent! mkview "make vim save view (state) (folds, cursor, etc)
" au BufWinEnter * silent! loadview "make vim load view (state) (folds, cursor, etc))

" set list                        " 显示Tab符
"set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set fillchars=vert:\ ,stl:\ ,stlnc:\    " 在被分割的窗口间显示空白

" set shortmess=atI               " 不显启动时的信息

if has('persistent_undo')
    if has("win32") || has("win64")
      set undodir=C:\Windows\Temp
    else
      set undodir=/tmp
    endif
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

if has('statusline')
    set laststatus=2

" Broken down into easily includeable segments
    set statusline=%<%f\                        " Filename
    set statusline+=%w%h%m%r                    " Options
    set statusline+=%{fugitive#statusline()}    " Git Hotness
    set statusline+=\ [%{&ff}/%Y] " Filetype
    set statusline+=\ [%{getcwd()}]             " Current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%     " Right aligned file nav info

    " let g:airline_theme='powerlineish' " airline users use the powerline theme
    " let g:airline_powerline_fonts=1    " and the powerline fonts
endif



" 记得上次退出时的位置
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
"}}}

"{{{ Encode
set encoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set termencoding=utf-8
"}}}
"{{{ judge OS gui
if has("win32") || has("win64") || has("win32unix")
    let g:OS#name = "win"
    let g:OS#win = 1
    let g:OS#mac = 0
    let g:OS#unix = 0
elseif has("mac")
    let g:OS#name = "mac"
    let g:OS#mac = 1
    let g:OS#win = 0
    let g:OS#unix = 0
elseif has("unix")
    let g:OS#name = "unix"
    let g:OS#unix = 1
    let g:OS#win = 0
    let g:OS#mac = 0
endif
if has("gui_running")
    let g:OS#gui = 1
else
    let g:OS#gui = 0
endif
"}}}

"{{{ GUI Settings
if g:OS#gui
    if g:OS:win
        "激活菜单栏
        noremap <M-Space> :simalt ~<CR> 
        inoremap <M-Space> <C-O>:simalt ~<CR>
        cnoremap <M-Space> <C-C>:simalt ~<CR>
        set guifont=Microsoft\ YaHei,Courier\ New:h12
        " au GUIEnter * simalt ~x			" 窗口启动时自动最大化
    else
        set guifont=Microsoft\ YaHei
    endif

    "解决菜单栏乱码
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    language messages zh_CN.utf-8   " 解决consle输出乱码

    set guioptions-=m				" 隐藏菜单栏
    set guioptions-=T				" 隐藏工具栏
    set guioptions-=L				" 隐藏左侧滚动条
    set guioptions-=r				" 隐藏右侧滚动条
    set guioptions-=b				" 隐藏底部滚动条
    set showtabline=0				" 隐藏Tab栏
    set cursorline
    hi cursorline guibg=#333333
else
    if &term == 'xterm' || &term == 'screen'
        set t_Co=256                " 设置vim模式为256色
    endif
endif
"}}}

"{{{ Shortcuts
" Quit quickly
map <leader>f :q!<CR>
map <leader>z :x<CR>
cmap w!! %!sudo tee > /dev/null %

" Read binary
map <leader>rb :%!xxd<CR>
map <leader>rnb :%!xxd -r<CR>

" tab
nmap <Tab> :bn<CR>
nmap <s-Tab> :bp<CR>
nmap <leader>bd :bd<CR>

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv 

" Format the entire file
" autocmd BufWritePost *.c normal mzgg=G`z
nmap <leader>fef ggVG=``
nnoremap <leader>q gqip 

set pastetoggle=<leader>pp
map <leader>ss :setlocal spell!<CR>

" bash map
nmap <silent> <leader>cd :lcd %:h<CR>
nmap <silent> <leader>md :!mkdir -p %:p:h<CR>
nmap<leader>m :wa<CR>:make<CR>:cw<CR><CR>
map <leader>ax :!chmod a+x %<CR><CR>
nmap <C-k> :!sdcv <C-R>=expand("<cword>")<CR><CR>

" Disable the arrow keys 
nnoremap <UP> <Nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" nnoremap j gj
" nnoremap k gk

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l
" inoremap <C-h> <Esc><C-W>h
" inoremap <C-j> <Esc><C-W>j
" inoremap <C-k> <Esc><C-W>k
" inoremap <C-l> <Esc><C-W>l
nnoremap ; :
vnoremap ; :
"}}}

"{{{ TAB键的自动完成现在会忽略这些文件
set wildignore+=*.luac              " Lua byte code
set wildignore+=*.pyc               " Python byte code
set wildignore+=*.spl               " compiled spelling word lists
set wildignore+=*.sw?               " Vim swap files
set wildignore+=*.aux,*.out,*.toc   " LaTeX intermediate files
set wildignore+=*.png,*.jpg,*.jpeg,*.bmp,*.gif   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.so,*.manifest " compiled object files
set wildignore+=*.zip,*.tar,*.gz,*.7z " Zip file
"}}}

"{{{ note-taking
"if has("autocmd")
    "autocmd bufwritepost .vimrc source $MYVIMRC
"endif

" Some helpers to edit mode
nmap <leader>ew :e <C-R>=expand('%:h').'/'<cr>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
map <silent> <leader>sv :so $MYVIMRC<CR>

autocmd FileType help set ma
autocmd FileType help set noreadonly
"}}}

"{{{ ctrlp.vim
let g:ctrlp_map = ',,'
let g:ctrlp_open_multiple_files = 'v'

let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(log|jpg|png|jpeg|exe|so|dll)$',
    \ }
"}}}

"{{{ ack.vim
if executable('ack')
    let g:ackprg="ack -H --nocolor --nogroup --column"
endif
"}}}

"{{{ tabular.vim
nmap <Leader>a& :Tabularize /&<CR>
vmap <Leader>a& :Tabularize /&<CR>
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a:: :Tabularize /:\zs<CR>
vmap <Leader>a:: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>
nmap <Leader>a<Space> :Tabularize / /<CR>
vmap <Leader>a<Space> :Tabularize / /<CR>
nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
vmap <Leader>a<Bar> :Tabularize /<Bar><CR>

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
    let p = '^\s*|\s.*\s|\s*$'
    if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
        let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
        let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
        Tabularize/|/l1
        normal! 0
        call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
endfunction
"}}}

"{{{ delimitmate.vim
au FileType * let b:delimitMate_autoclose = 1

" If using html auto complete (complete closing tag)
au FileType xml,html,xhtml let b:delimitMate_matchpairs ="(:),[:],{:}"
"}}}

"{{{ supertab
" let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
"}}}

"{{{ nerdcommenter.vim
" [count],cc 光标以下 count 行逐行添加注释(9,cc)
" [count],cu 光标以下 count 行逐行取消注释(9,cu)
" [count],cm 光标以下 count 行尝试添加块注释(9,cm)
" [count],cs 光标以下 count 行尝试添加美观的块注释(9,cm)
" ,ca 切换注释方式
" ,cA 在行尾插入注释符号并且进入插入模式。

" 空格键添加去除注释
" map <space> <leader>ci
" map <space> <plug>NERDCommenterInvert
" let NERDCreateDefaultMappings=0

let NERDSpaceDelims=1       " 让注释符与语句之间留一个空格
let NERDCompactSexyComs=1   " 多行注释时样子更好看
"}}}

"{{{ tagbar.vim
nmap <silent> ,t :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 36

set tags+=~/Dropbox/src/tags/cpp_tags;

function Updatetags()
    if &filetype == "c"
        exec "!ctags --fields=+iaS --extra=+q *.c *.h ../include/*.h"
    elseif &filetype == "cpp"
        exec "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q *.cpp *.h"
    endif
endfunction

nmap <leader>g :call Updatetags()<CR>
"}}}

"{{{ OmniCppComplete 
" C++ code completion:  http://vim.wikia.com/wiki/VimTip1608
set completeopt=longest,menu        " 关掉智能补全时的预览窗口(new-omni-completion)
let OmniCpp_MayCompleteDot = 1      " autocomplete with .
let OmniCpp_MayCompleteArrow = 1    " autocomplete with ->
let OmniCpp_MayCompleteScope = 1    " autocomplete with ::
let OmniCpp_SelectFirstItem = 2     " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2     " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype in popup window
let OmniCpp_GlobalScopeSearch=1     " enable the global scope search
let OmniCpp_DisplayMode=1           " Class scope completion mode: always show all members
let OmniCpp_DefaultNamespaces=["std"]
let OmniCpp_ShowScopeInAbbr=1       " show scope in abbreviation and remove the last column
let OmniCpp_ShowAccess=1 
"}}}

"{{{ DoxygenToolkit.vim
" highlight the doxygen comments
let g:load_doxygen_syntax=1
set syntax=cpp.doxygen

let g:DoxygenToolkit_authorName="xutao butbueatiful@gmail.com"
let g:DoxygenToolkit_versionString="1.0"
let s:licenseTag = "Copyright(C)\<enter>"
let s:licenseTag = s:licenseTag . "For free\<enter>"
let s:licenseTag = s:licenseTag . "All right reserved"
let g:DoxygenToolkit_licenseTag = s:licenseTag
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1

nmap dx :Dox<CR>
nmap da :DoxAut<CR>
nmap dl :DoxLic<CR>

autocmd BufNewFile *.{h,hpp,c,cpp} DoxAuthor
"}}}

"{{{ NERDTree.vim
":ERDtree 打开NERD_tree :NERDtreeClose    关闭NERD_tree  
"o 打开关闭文件或者目录 t 在标签页中打开  
"T 在后台标签页中打开   ! 执行此文件  
"p 到上层目录           P 到根目录  
"K 到第一个节点         J 到最后一个节点  
"u 打开上层目录         m 显示文件系统菜单（添加、删除、移动操作）  
"r 递归刷新当前目录     R 递归刷新当前根目录  
nmap ,n :NERDTreeToggle<CR>
let NERDTreeShowLineNumbers=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeWinpos="left"
let NERDTreeQuitOnOpen=1            " 打开文件后, 关闭NERDTrre窗口
let NERDTreeWinSize=31              " 设置窗口大小
"let NERDTreeHighlightCursorline=1  " 高亮NERDTrre窗口的当前行
"}}}

"{{{ vim-markdown.vim
let g:vim_markdown_folding_disabled=1
"}}}

"{{{ Fugitive.vim
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>:GitGutter<CR>
nnoremap <silent> <leader>gg :GitGutterToggle<CR>
"}}}

"{{{ QuickFix Window, which is borrowed from c9s
command -bang -nargs=? QFix call QFixToggle(<bang>0)

function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win=bufnr("$")
  endif
endfunction

nnoremap <leader>qx :QFix<CR>
autocmd BufWinEnter quickfix let g:qfix_win = bufnr("$")
"}}}

"{{{ man.vim
source $VIMRUNTIME/ftplugin/man.vim
nnoremap <silent> <S-k> :Man <c-r>=expand("<cword>")<CR><CR>
"}}}

" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:
