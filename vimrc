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
"    Author: xutao(TonyXu), hhktony@gmail.com
"   Company: myself

" Bundle {
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

"------------------
" Code Completions
"------------------
Bundle 'Raimondi/delimitMate'
" Bundle 'hhktony/snipmate.vim'
Bundle 'SirVer/ultisnips'
" Bundle 'honza/vim-snippets'
Bundle 'tpope/vim-repeat'

"--------------
" Fast editing
"--------------
Bundle 'hhktony/vim-authorinfo'
Bundle 'junegunn/vim-easy-align'

"--------------
" IDE features
"--------------
Bundle 'a.vim'
Bundle 'easymotion/vim-easymotion'
Bundle 'terryma/vim-multiple-cursors'
" Bundle 'L9'
" Bundle 'othree/vim-autocomplpop'
Bundle 'DoxygenToolkit.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
Bundle 'vim-airline/vim-airline'
" Bundle 'vim-airline/vim-airline-themes'

"----------------------------------------
" ruby
"----------------------------------------
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'

"----------------------------------------
" python
"----------------------------------------
Bundle 'nvie/vim-flake8'
Bundle 'python_match.vim'

"----------------------------------------
" golang
"----------------------------------------
Bundle 'fatih/vim-go'

"----------------------------------------
" html
"----------------------------------------
Bundle 'mattn/emmet-vim'
Bundle 'amirh/HTML-AutoCloseTag'
" Bundle 'hail2u/vim-css3-syntax'
" Bundle 'gorodinskiy/vim-coloresque'
" Bundle 'tpope/vim-haml'

"----------------------------------------
" Syntax/Indent for language enhancement
"----------------------------------------
Bundle 'tpope/vim-markdown'
" }

" General {
filetype on                     " 检测文件类型
filetype indent on              " 针对不同的文件类型采用不同的缩进格式
filetype plugin on
filetype plugin indent on       " 启动自动补全
syntax on                       " 启动语法高亮

set history=100                 " 命令显示历史
let g:mapleader = ","           " 全局设置用,代替\

set shortmess=atI               " I不显启动时的信息
set showmode                    " 在插入、替换和可视模式里，在最后一行提供消息
set showcmd                     " 在屏幕最后一行显示 (部分的) 命令
" set showtabline=2               " 标签页：0不显示
                                "         1至少有两个标签页时才显示
                                "         2显示
set matchtime=1                 " 跳转到匹配括号的时间
set number                      " 显示行号
set scrolloff=3                 " 上下滚动隔3行
set cmdheight=1                 " 命令行的高度，默认为1
set ruler                       " 右下角显示光标位置的状态行
set vb t_vb=                    " 关闭响铃和闪烁
set novb
set noeb
" set t_ti= t_te=                 " 退出vim后，内容显示在终端屏幕

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
set autoindent                  " 继承前一行的缩进方式
set smartindent                 " 为c/c++程序提供自动缩进
set cindent                     " c/c++样式缩进
set cinoptions=:0,l1,t0,g0      " Linux kernel style
set cpoptions+=$                " cw显示$
set wrap                        " 自动换行
set textwidth=78
set formatoptions+=mM

set modeline                    " 开启模式行支持
set autoread                    " 当文件在外部被修改时，自动重新读取
set hidden                      " 允许在有未保存的修改时切换缓冲区
set ttyfast

set path+=../include            " gf搜索路径
"set autochdir                  " 当前目录为工作目录

" set iskeyword+=_,$,@,%,#,-    " 包含这些字符时当作一个单词
set dictionary+=~/.vim/dict/simple  " For i_CTRL_X_K

" set list                        " 显示Tab符
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
set fillchars=vert:\ ,stl:\ ,stlnc:\    " 在被分割的窗口间显示空白
set completeopt=menu,menuone,longest
"}

" Backups {
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
" }

" AutoGroups codeing style {
autocmd Filetype css,html,ruby,php,javascript setlocal ts=2 sts=2 sw=2
" }

" Encode {
set encoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set termencoding=utf-8
" }

" Record exit position {
au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ execute 'normal! g`"zvzz' |
    \ endif
" }

" UI {
if &term == 'xterm' || &term == 'screen'
    set t_Co=256    " 颜色数目为256
endif
" set background=dark
if &diff
    colorscheme github
else
    colorscheme molokai
endif

if (exists('+colorcolumn'))
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

    set statusline+=%{fugitive#statusline()}    " Git Hotness
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    set statusline+=%=%-10.(%l,%c%V\ \:\ %p%%%)\ " Right aligned file nav info
endif
" }

" Bindings {
cmap w!! %!sudo tee > /dev/null %

" Splits ,v and ,h to open new splits (vertical and horizontal)
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>j

nnoremap <silent> <Tab> :bn<CR>
nnoremap <silent> <S-Tab> :bp<CR>

vnoremap > >gv
vnoremap < <gv

nmap <silent> <Leader>fef ggVG=``
nnoremap <Leader>q gqip

nnoremap * *<c-o>
nnoremap # #<c-o>
nnoremap n nzzzv
nnoremap N Nzzzv
" nnoremap / /\v
" vnoremap / /\v
nnoremap <silent> <Leader><CR> :noh<CR>

nnoremap + <C-a>
nnoremap - <C-x>

set pastetoggle=<F5>
" nmap <silent> <Leader>ss :setlocal spell!<CR>

nnoremap <Leader>W :%s/\s\+$//<CR>:let @/=''<CR>

nmap <C-\> :!sdcv <C-R>=expand("<cword>")<CR><CR>

nmap <Leader>rb :%!xxd<CR>
nmap <Leader>nrb :%!xxd -r<CR>

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
" Space to toggle folds.
" nnoremap <Space> za
" vnoremap <Space> za
" "Refocus" folds
nnoremap ,z zMzvzz
" Make zO recursively open whatever top level fold we're in, no matter where
" the cursor happens to be.
nnoremap zO zCzO
" }

" Wildmenu completion {
set wildmenu                    " 命令补全
set wildmode=longest:list:full  " 命令模式Tab补全顺序

set wildignore+=*.luac                          " Lua byte code
set wildignore+=*.pyc                           " Python byte code
set wildignore+=*.spl                           " compiled spelling word lists
set wildignore+=*.sw?                           " Vim swap files
set wildignore+=*.aux,*.out,*.toc               " LaTeX intermediate files
set wildignore+=*.mp3,*.mp4,*.avi,*.mkv         " media format
set wildignore+=*.png,*.jpg,*.jpeg,*.bmp,*.gif  " binary images
set wildignore+=*.zip,*.tar,*.gz,*.7z           " Zip file
set wildignore+=*.o,*.obj,*.exe,*.dll,*.so,*.a  " compiled object files
set wildignore+=*.git*,*.hg*,*.svn*             " version control system
" }

" ctrlp.vim {
" let g:ctrlp_map = ',,'
nmap <leader>b :CtrlPBuffer<CR>
" nmap <leader>t :CtrlP<CR>
nmap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
let g:ctrlp_open_multiple_files = 'v'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(log|jpg|png|jpeg|exe|a|so|pyc|pyo|dll)$',
    \ }
" }

" vim-airline {
if has('statusline')
    " let g:airline_theme='powerlineish'
    let g:airline#extensions#branch#enabled = 1
    " let g:airline_powerline_fonts=1
    " let g:airline_section_c = '%f%m'
    let g:airline#extensions#tabline#fnamemod     = ':t' "显示短路径文件名
    let g:airline#extensions#tabline#enabled      = 1
    let g:airline#extensions#tabline#tab_nr_type  = 1
    let g:airline#extensions#tabline#left_sep     = '>'
    let g:airline#extensions#tabline#left_alt_sep = '>'
endif
" }

" ack.vim {
if executable('ack')
    let g:ackprg="ack -H --nocolor --nogroup --column"
endif
" }

" tabular.vim {
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
" }

" vim-easy-align {
vnoremap <silent> <Leader>a :EasyAlign<Enter>
" }

" delimitmate.vim {
au FileType * let b:delimitMate_autoclose = 1
au FileType xml,html,xhtml let b:delimitMate_matchpairs ="(:),[:],{:}"
" }

" ultisnips {
let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
let g:UltiSnipsExpandTrigger       = '<C-j>'
let g:UltiSnipsJumpForwardTrigger  = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
map <leader>us :UltiSnipsEdit<CR>
" }

" tagbar.vim {
nmap <Leader>t :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 36
set tags=./tags
" Make tags placed in .git/tags file available in all levels of a repository
let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
if gitroot != ''
    let &tags = &tags . ',' . gitroot . '/tags'
endif
nmap <Leader>g :!uptags.sh<CR>

" }

" syntastic {
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_auto_jump = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "w>"
" }

" YouCompleteMe {
let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_goto_buffer_command = 'horizontal-split'
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_c_conf.py'
" let g:ycm_server_use_vim_stdout = 1
" let g:ycm_server_log_level = 'debug'
let g:ycm_complete_in_strings = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_confirm_extra_conf = 0

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

nnoremap <silent> <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
" }

" vim-go {
let g:go_fmt_command = "goimports"
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)
" }

" RoR {
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
" }

" vim-authorinfo {
let g:authorinfo_author  = 'xutao(Tony Xu)'
let g:authorinfo_email   = 'hhktony@gmail.com'
let g:authorinfo_company = 'myself'
" }

" nerdcommenter.vim {
" [n],cc n 行逐行添加注释(9,cc)
" [n],cu n 行逐行取消注释(9,cu)
" [n],cm n 行尝试添加块注释(9,cm)
" [n],cs n 行尝试添加美观的块注释(9,cm)
" ,ca 切换注释方式
" ,cA 在行尾插入注释符号并且进入插入模式。

" 空格键添加去除注释
" map <space> <Leader>ci
map <space> <plug>NERDCommenterInvert
" let NERDCreateDefaultMappings=0
let NERDSpaceDelims = 1     " 让注释符与语句之间留一个空格
let NERDCompactSexyComs = 1       " 多行注释时样子更好看
" }

" DoxygenToolkit.vim {
" highlight the doxygen comments
set syntax=cpp.doxygen
let g:load_doxygen_syntax=1
let s:licenseTag = "Copyright(C)\<enter>"
let s:licenseTag = s:licenseTag . "For free\<enter>"
let s:licenseTag = s:licenseTag . "All right reserved"
let g:DoxygenToolkit_licenseTag = s:licenseTag
let g:DoxygenToolkit_authorName        = "xutao hhktony@gmail.com"
let g:DoxygenToolkit_versionString     = "1.0"
let g:DoxygenToolkit_briefTag_funcName = "yes"
let g:doxygen_enhanced_color=1

nmap dx :Dox<CR>
nmap da :DoxAut<CR>
nmap dl :DoxLic<CR>
" autocmd BufNewFile *.{h,hpp,c,cpp,cc} DoxAuthor
" }

" nerdtree {
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
nmap <silent> <Leader>f :NERDTreeFind<CR>
let g:NERDSpaceDelims=1
let NERDTreeShowLineNumbers     = 1
let NERDTreeIgnore              = ['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeWinpos              = "left"
let NERDTreeQuitOnOpen          = 1     " 打开文件后, 关闭NERDTrre窗口
let NERDTreeWinSize             = 31    " 设置窗口大小
let NERDTreeHighlightCursorline = 1   " 高亮NERDTrre窗口的当前行
" }

" Fugitive.vim {
" nnoremap <silent> <Leader>gs :Gstatus<CR>
" nnoremap <silent> <Leader>gd :Gdiff<CR>
" nnoremap <silent> <Leader>gc :Gcommit<CR>
" nnoremap <silent> <Leader>gb :Gblame<CR>
" nnoremap <silent> <Leader>gl :Glog<CR>
" nnoremap <silent> <Leader>gp :Git push<CR>
" nnoremap <silent> <Leader>gw :Gwrite<CR>:GitGutter<CR>
" }

" vim-multiple-cursors {
" let g:multi_cursor_use_default_mapping=0
" Default mapping
" let g:multi_cursor_next_key='<C-m>'
" let g:multi_cursor_prev_key='<C-p>'
" let g:multi_cursor_skip_key='<C-x>'
" let g:multi_cursor_quit_key='<Esc>'
"}

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

" vim: set et sw=4 ts=4 sts=4 tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:
