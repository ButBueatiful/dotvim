" Bundle {{{
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
" Bundle 'mattn/zencoding-vim'
Bundle 'Raimondi/delimitMate'
" Bundle 'ervandew/supertab'
Bundle 'SirVer/ultisnips'
" Bundle 'garbas/vim-snipmate'
"------ snipmate dependencies -------
" Bundle 'MarcWeber/vim-addon-mw-utils'
" Bundle 'tomtom/tlib_vim'

"-----------------
" Fast navigation
"-----------------
Bundle 'tsaleh/vim-matchit'
Bundle 'Lokaltog/vim-easymotion'

"--------------
" Fast editing
"--------------
" Bundle 'Valloric/YouCompleteMe'
Bundle 'ButBueatiful/vim-authorinfo'
Bundle 'DoxygenToolkit.vim'
Bundle 'OmniCppComplete'
Bundle 'scrooloose/nerdcommenter'
Bundle 'junegunn/vim-easy-align'
" Bundle 'a.vim'
" Bundle 'godlygeek/tabular'
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
Bundle 'scrooloose/syntastic'
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
" Bundle 'mattn/emmet-vim'
Bundle 'lilydjwg/colorizer'

"------- markup language -------
" Bundle 'tpope/vim-markdown'
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

" General {{{
set history=100                 " 命令显示历史
let g:mapleader = ","           " 全局设置用,代替\

set shortmess=atI               " I不显启动时的信息
set showmode                    " 在插入、替换和可视模式里，在最后一行提供消息
set showcmd                     " 在屏幕最后一行显示 (部分的) 命令
set showtabline=2               " 标签页：0永远不 1至少有两个标签页时才会 2永远会
set matchtime=1                 " 跳转到匹配括号的时间
set number                      " 显示行号
set scrolloff=3                 " 上下滚动隔3行
set cmdheight=1                 " 命令行的高度，默认为1
set ruler                       " 右下角显示光标位置的状态行
set vb t_vb=                    " 关闭响铃和闪烁
set novb
set noeb
syntax on                       " 启动语法高亮，使用 'background' 来设置颜色

set magic                       " 增强行正则

set ignorecase                  " 搜索时忽略大小写
set smartcase                   " 如果搜索模式包含大写字符，
set gdefault                    " 默认开启全局匹配(在替换时不用输入g)
set incsearch                   " 开启实时搜索功能
set showmatch                   " 显示括号配对情况
set hlsearch                    " 开启高亮显示结果
set wrapscan                    " 搜索到文件两端时重新搜索

set backspace=indent,eol,start  " 退格键和方向键可以换行
set whichwrap=b,s,h,l,<,>,[,]   " 允许backspace和光标键跨越行边界

set shiftwidth=4                " 使用4个空格缩进
set tabstop=4                   " 编辑时一个Tab字符占4个空格的位置
set softtabstop=4               " 每次退格将删除4个空格
set expandtab                   " 将输入的Tab自动展开成空格
set smarttab                    " 在行首按Tab将加入sw个空格，否则加入ts个空格

set cpoptions+=$                " cw显示$
set wrap                        " 自动换行
set textwidth=78
set formatoptions+=mM
" set colorcolumn=78              " 在第 78 列显示一条竖线
" set cursorline                  " 突出显示当前行

" set modeline                    " 开启模式行支持
set autoread                    " 当文件在外部被修改时，自动重新读取
set hidden                      " 允许在有未保存的修改时切换缓冲区
set ttyfast

set autoindent                  " 继承前一行的缩进方式
set smartindent                 " 为c/c++程序提供自动缩进
set cindent                     " c/c++样式缩进

set path+=../include            " gf搜索路径
"set autochdir                  " 当前目录为工作目录

" set iskeyword+=_,$,@,%,#,-    " 包含这些字符时当作一个单词
set dictionary+=~/.vim/dict/simple  " For i_CTRL_X_K

" set list                        " 显示Tab符
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
set fillchars=vert:\ ,stl:\ ,stlnc:\    " 在被分割的窗口间显示空白

"}}}

" Backups {{{
set nobackup   " 设置无备份文件
set noswapfile " 不生成swap文件

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
" }}}

" Encode {{{
set encoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set termencoding=utf-8
" }}}

" Record exit position {{{
" au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ execute 'normal! g`"zvzz' |
    \ endif
" }}}

" Judge OS gui {{{
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
else
    let g:iswindows = 0
endif

if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif
" }}}

" {{{ UI
if has('statusline')
    set laststatus=2
    " Broken down into easily includeable segments
    " set statusline=%<%f\                        " Filename
    " set statusline+=%W%H%M%R                    " Options
    " set statusline+=%{fugitive#statusline()}    " Git Hotness
    " set statusline+=\ [%{&ff}\|%Y]              " Filetype
    " set statusline+=\ [%{getcwd()}]             " Current dir
    " set statusline+=%=%-14.(%l,%c%V%)\ %p%%     " Right aligned file nav info
endif

if g:isGUI
    "解决菜单栏乱码
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    " 解决consle输出乱码
    language messages zh_CN.utf-8

    set guioptions-=m   " 隐藏菜单栏
    set guioptions-=T   " 隐藏工具栏
    set guioptions-=L   " 隐藏左侧滚动条
    set guioptions-=r   " 隐藏右侧滚动条

    set background=light
    colorscheme solarized

    set linespace=0     " 行与行之间没有多余的空格

    " au WinLeave * set nocursorline nocursorcolumn
    " au WinEnter * set cursorline cursorcolumn
    set cursorline cursorcolumn
    hi cursorline guibg=#333333
    hi cursorcolumn guibg=#333333

    if g:iswindows
        "激活菜单栏
        noremap <M-Space> :simalt ~<CR>
        inoremap <M-Space> <C-O>:simalt ~<CR>
        cnoremap <M-Space> <C-C>:simalt ~<CR>
        set guifont=Microsoft\ YaHei,Courier\ New:h12
        au GuiEnter * set t_vb=
        " au GUIEnter * simalt ~x   " 窗口启动时自动最大化
    else
        set guifont=Microsoft\ YaHei
    endif
else
    if &term == 'xterm' || &term == 'screen'
        set t_Co=256    " 颜色数目为256
    endif
    set background=dark
    colorscheme molokai " 设置主题
endif
" }}}

" Folding {{{
" au BufWinLeave * silent! mkview   " 让vim保存当前的折叠
" au BufWinEnter * silent! loadview " 打开上次保存的折叠样式
set foldlevelstart=0

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" "Refocus" folds
nnoremap ,z zMzvzz

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

function! MyFoldText()
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

" expand tabs into spaces
    let onetab = strpart(' ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction
set foldtext=MyFoldText()
" }}}

" Convenience mappings {{{
cmap w!! %!sudo tee > /dev/null %

nmap <silent> <Leader>ev :e $MYVIMRC<CR>
nmap <silent> <Leader>sv :so $MYVIMRC<CR>

nmap <silent> <Tab> :bn<CR>
nmap <silent> <S-Tab> :bp<CR>
nmap <silent> <Leader>bd :bd<CR>
vnoremap > >gv
vnoremap < <gv

" autocmd BufWritePost *.c normal mzgg=G`z
nmap <silent> <Leader>fef ggVG=``
" 格式化段落
nnoremap <Leader>q gqip

nnoremap * *<c-o>
nnoremap # #<c-o>
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap / /\v
vnoremap / /\v
nnoremap <silent> <Leader><CR> :noh<CR>

set pastetoggle=<Leader>pp
nmap <silent> <Leader>ss :setlocal spell!<CR>

" 删除所有行尾的空格
nnoremap <Leader>W :%s/\s\+$//<CR>:let @/=''<CR>

" BASH Maps
nmap <silent> <Leader>cd :lcd %:h<CR>
nmap <silent> <Leader>md :!mkdir -p %:p:h<CR>
nmap <Leader>m :wa<CR>:make<CR>:cw<CR><CR>
nmap <Leader>ax :!chmod a+x %<CR>:!./%<CR>
nmap <C-\> :!sdcv <C-R>=expand("<cword>")<CR><CR>

" Read binary
nmap <Leader>rb :%!xxd<CR>
nmap <Leader>nrb :%!xxd -r<CR>

inoremap <C-A> <Esc>I
inoremap <C-E> <Esc>A

nnoremap j gj
nnoremap k gk

nnoremap <F1> <ESC>
inoremap <F1> <ESC>
vnoremap <F1> <ESC>

cnoremap <C-A> <Home>
cnoremap <C-B> <Left>
cnoremap <C-E> <End>
cnoremap <C-F> <Right>
cnoremap <C-N> <End>
cnoremap <C-P> <Up>
cnoremap <ESC>b <S-Left>
cnoremap <ESC><C-B> <S-Left>
cnoremap <ESC>f <S-Right>
cnoremap <ESC><C-F> <S-Right>
cnoremap <ESC><C-H> <C-W>

nnoremap ; :
vnoremap ; :

" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l
" inoremap <C-h> <Esc><C-W>h
" inoremap <C-j> <Esc><C-W>j
" inoremap <C-k> <Esc><C-W>k
" inoremap <C-l> <Esc><C-W>l
" }}}

" Wildmenu completion {{{
set wildmenu                    " 命令补全
set wildmode=longest:list:full  " 命令模式Tab补全顺序

set wildignore+=*.luac              " Lua byte code
set wildignore+=*.pyc               " Python byte code
set wildignore+=*.spl               " compiled spelling word lists
set wildignore+=*.sw?               " Vim swap files
set wildignore+=*.aux,*.out,*.toc   " LaTeX intermediate files
set wildignore+=*.mp3,*.mp4,*.avi,*.mkv " media format"
set wildignore+=*.png,*.jpg,*.jpeg,*.bmp,*.gif   " binary images
set wildignore+=*.zip,*.tar,*.gz,*.7z " Zip file
set wildignore+=*.o,*.obj,*.exe,*.dll,*.so,*.a " compiled object files
set wildignore+=*.git*,*.hg*,*.svn* " version control system
" }}}

" ctrlp.vim {{{
" let g:ctrlp_map = ',,'
let g:ctrlp_open_multiple_files = 'v'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(log|jpg|png|jpeg|exe|so|dll)$',
    \ }
" }}}

" vim-airline {{{
if has('statusline')
    let g:airline_theme='powerlineish' " airline users use the powerline theme
    " let g:airline_powerline_fonts=1    " and the powerline fonts
    " let g:airline_section_c = '%f%m'
    let g:airline#extensions#tabline#fnamemod     = ':t' "显示短路径文件名
    let g:airline#extensions#tabline#enabled      = 1
    let g:airline#extensions#tabline#tab_nr_type  = 1
    let g:airline#extensions#tabline#left_sep     = '>'
    let g:airline#extensions#tabline#left_alt_sep = '>'
endif
" }}}

" ack.vim {{{
if executable('ack')
    let g:ackprg="ack -H --nocolor --nogroup --column"
endif
" }}}

" vim-markdown.vim {{{
let g:vim_markdown_folding_disabled=1
" }}}

" tabular.vim {{{
" nmap <Leader>a& :Tabularize /&<CR>
" vmap <Leader>a& :Tabularize /&<CR>
" nmap <Leader>a= :Tabularize /=<CR>
" vmap <Leader>a= :Tabularize /=<CR>
" nmap <Leader>a: :Tabularize /:<CR>
" vmap <Leader>a: :Tabularize /:<CR>
" nmap <Leader>a:: :Tabularize /:\zs<CR>
" vmap <Leader>a:: :Tabularize /:\zs<CR>
" nmap <Leader>a, :Tabularize /,<CR>
" vmap <Leader>a, :Tabularize /,<CR>
" nmap <Leader>a<Space> :Tabularize / /<CR>
" vmap <Leader>a<Space> :Tabularize / /<CR>
" nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
" vmap <Leader>a<Bar> :Tabularize /<Bar><CR>

" inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

" function! s:align()
    " let p = '^\s*|\s.*\s|\s*$'
    " if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
        " let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
        " let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
        " Tabularize/|/l1
        " normal! 0
        " call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    " endif
" endfunction
" }}}

" vim-easy-align {{{
vnoremap <silent> <Leader>a :EasyAlign<Enter>
" }}}

" delimitmate.vim {{{
au FileType * let b:delimitMate_autoclose = 1
" If using html auto complete (complete closing tag)
au FileType xml,html,xhtml let b:delimitMate_matchpairs ="(:),[:],{:}"
" }}}

" supertab {{{
" let g:SuperTabRetainCompletionType=2
" let g:SuperTabDefaultCompletionType = "context"
" let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
" }}}

" ultisnips {{{
let g:UltiSnipsExpandTrigger       = '<Tab>'
let g:UltiSnipsJumpForwardTrigger  = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
let g:UltiSnipsListSnippets        = '<c-tab>'
let g:UltiSnipsEditSplit           = 'horizontal'
" 自定义代码片段存放于`~/.vim/snippets`里，当与默认重名时会有提示
let g:UltiSnipsSnippetDirectories  = ["UltiSnips", "snippets"]
" let g:UltiSnipsSnippetsDir         = '~/.vim/snippets'
" }}}

" tagbar.vim {{{
nmap <silent> <Leader>t :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 36

set tags+=~/Dropbox/src/tags/cpp_tags;

function Updatetags()
    if &filetype == "c"
        exec "!ctags --fields=+iaS --extra=+q `find ../ -name \"*.[ch]\"`"
    elseif &filetype == "cpp"
        exec "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q *.cpp *.h"
    endif
endfunction

nmap <leader>g :call Updatetags()<CR>
" }}}

" syntastic {{{
" let g:syntastic_check_on_open = 1
" let g:syntastic_auto_jump = 1
" }}}

" OmniCppComplete {{{
" C++ code completion:  http://vim.wikia.com/wiki/VimTip1608
set completeopt=longest,menu        " 关掉智能补全时的预览窗口(new-omni-completion)
let OmniCpp_MayCompleteDot      = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow    = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope    = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem     = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch     = 2 " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype in popup window
let OmniCpp_GlobalScopeSearch   = 1 " enable the global scope search
let OmniCpp_DisplayMode         = 1 " Class scope completion mode: always show all members
let OmniCpp_ShowScopeInAbbr     = 1 " show scope in abbreviation and remove the last column
let OmniCpp_ShowAccess          = 1
let OmniCpp_DefaultNamespaces   = ["std"]
" }}}

" vim-authorinfo {{{
let g:authorinfo_author  = 'xutao(butbueatiful)'
let g:authorinfo_email   = 'butbueatiful@gmail.com'
let g:authorinfo_company = 'myself'
" }}}

" nerdcommenter.vim {{{
" [count],cc 光标以下 count 行逐行添加注释(9,cc)
" [count],cu 光标以下 count 行逐行取消注释(9,cu)
" [count],cm 光标以下 count 行尝试添加块注释(9,cm)
" [count],cs 光标以下 count 行尝试添加美观的块注释(9,cm)
" ,ca 切换注释方式
" ,cA 在行尾插入注释符号并且进入插入模式。

" 空格键添加去除注释
" map <space> <Leader>ci
" map <space> <plug>NERDCommenterInvert
" let NERDCreateDefaultMappings=0

let NERDSpaceDelims     = 1       " 让注释符与语句之间留一个空格
let NERDCompactSexyComs = 1   " 多行注释时样子更好看
" }}}

" DoxygenToolkit.vim {{{
" highlight the doxygen comments
set syntax=cpp.doxygen
let g:load_doxygen_syntax=1

let s:licenseTag = "Copyright(C)\<enter>"
let s:licenseTag = s:licenseTag . "For free\<enter>"
let s:licenseTag = s:licenseTag . "All right reserved"
let g:DoxygenToolkit_licenseTag = s:licenseTag

let g:DoxygenToolkit_authorName        = "xutao butbueatiful@gmail.com"
let g:DoxygenToolkit_versionString     = "1.0"
let g:DoxygenToolkit_briefTag_funcName = "yes"

let g:doxygen_enhanced_color=1

nmap dx :Dox<CR>
nmap da :DoxAut<CR>
nmap dl :DoxLic<CR>

" autocmd BufNewFile *.{h,hpp,c,cpp,cc} DoxAuthor
" }}}

" NERDTree.vim {{{
" :ERDtree        打开NERD_tree
" :NERDtreeClose  关闭NERD_tree
" o 打开关闭文件或者目录
" t 在标签页中打开
" T 在后台标签页中打开
" ! 执行此文件
" p/P 到上层目录
" K/J 到第一个/最后一个节点
" u 打开上层目录
" r 刷新当前目录
" R 递归刷新当前根目录
" m 显示文件系统菜单 添加、删除、移动操作
nmap <silent> <Leader>n :NERDTreeToggle<CR>
let NERDTreeShowLineNumbers = 1
let NERDTreeIgnore          = ['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeWinpos          = "left"
let NERDTreeQuitOnOpen      = 1     " 打开文件后, 关闭NERDTrre窗口
let NERDTreeWinSize         = 31    " 设置窗口大小
"let NERDTreeHighlightCursorline=1  " 高亮NERDTrre窗口的当前行
" }}}

" Fugitive.vim {{{
nnoremap <silent> <Leader>gs :Gstatus<CR>
nnoremap <silent> <Leader>gd :Gdiff<CR>
nnoremap <silent> <Leader>gc :Gcommit<CR>
nnoremap <silent> <Leader>gb :Gblame<CR>
nnoremap <silent> <Leader>gl :Glog<CR>
nnoremap <silent> <Leader>gp :Git push<CR>
nnoremap <silent> <Leader>gw :Gwrite<CR>:GitGutter<CR>
" }}}

" QuickFix Window {{{
nnoremap <Leader>qx :ccl<CR>
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
" }}}

" man.vim {{{
if filereadable($VIMRUNTIME . "/ftplugin/man.vim")
    source $VIMRUNTIME/ftplugin/man.vim
    nnoremap <silent> <S-k> :Man <c-r>=expand("<cword>")<CR><CR>
endif
" }}}

" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:
